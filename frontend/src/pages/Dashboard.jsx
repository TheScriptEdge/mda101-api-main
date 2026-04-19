import {
  startTransition,
  useEffect,
  useMemo,
  useState,
} from 'react';
import { useNavigate } from 'react-router-dom';
import {
  AlertTriangle,
  CalendarDays,
  Clock3,
  LogOut,
  RefreshCcw,
  Sparkles,
  UserRoundCheck,
  Users,
} from 'lucide-react';

import {
  fetchShifts,
  logout,
  postback,
  SESSION_STORAGE_KEY,
} from '../lib/api';
import mdaLogo from '../assets/images/logo-mda-white.png';

import ThemeToggle from '../components/ThemeToggle';
import LoadingScreen from '../components/LoadingScreen';

function getSessionId() {
  return localStorage.getItem(SESSION_STORAGE_KEY);
}

function isUnauthorized(error) {
  return error?.status === 401;
}

function actionLabel(action) {
  if (!action) {
    return null;
  }
  if (action.type === 'claim') {
    return 'השתבץ';
  }
  if (action.type === 'cancel' || action.type === 'cancel_with_warning') {
    return 'בטל';
  }
  if (action.type === 'calendar') {
    return 'פתח';
  }
  return action.label;
}

function statusLabel(slot) {
  if (slot.status === 'available') {
    return 'פנוי';
  }
  if (slot.status === 'occupied') {
    return 'שובץ';
  }
  return 'נעול';
}

function slotHeading(slot) {
  return (
    slot.details?.display_name ||
    slot.text ||
    (slot.status === 'available' ? 'מקום פנוי' : 'לא זמין כרגע')
  );
}

function slotSubheading(slot) {
  if (slot.details?.qualification) {
    return slot.details.qualification;
  }
  if (slot.status === 'available') {
    return 'אפשר להשתבץ דרך הממשק החדש';
  }
  return 'ללא פרטים נוספים';
}

function flattenSlots(shiftBlocks) {
  return shiftBlocks.flatMap((block) => block.boards.flatMap((board) => board.slots));
}

export default function Dashboard() {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [busyAction, setBusyAction] = useState('');
  const navigate = useNavigate();

  const clearSession = async () => {
    const sessionId = getSessionId();
    localStorage.removeItem(SESSION_STORAGE_KEY);
    navigate('/', { replace: true });

    if (sessionId) {
      try {
        await logout(sessionId);
      } catch {
        // Ignore logout cleanup failures.
      }
    }
  };

  const loadDashboard = async ({ silent = false } = {}) => {
    const sessionId = getSessionId();
    if (!sessionId) {
      navigate('/', { replace: true });
      return;
    }

    if (!silent) {
      setLoading(true);
    }

    try {
      setError('');
      const result = await fetchShifts(sessionId);
      startTransition(() => {
        setData(result.data);
      });
    } catch (requestError) {
      if (isUnauthorized(requestError)) {
        await clearSession();
        return;
      }
      setError(requestError.message || 'לא הצלחנו לטעון את לוח המשמרות.');
    } finally {
      if (!silent) {
        setLoading(false);
      }
    }
  };

  useEffect(() => {
    const sessionId = getSessionId();
    if (!sessionId) {
      navigate('/', { replace: true });
      return undefined;
    }

    let cancelled = false;

    fetchShifts(sessionId)
      .then((result) => {
        if (cancelled) {
          return;
        }
        setError('');
        startTransition(() => {
          setData(result.data);
        });
      })
      .catch(async (requestError) => {
        if (cancelled) {
          return;
        }
        if (isUnauthorized(requestError)) {
          localStorage.removeItem(SESSION_STORAGE_KEY);
          navigate('/', { replace: true });
          try {
            await logout(sessionId);
          } catch {
            // Ignore logout cleanup failures.
          }
          return;
        }
        setError(requestError.message || 'לא הצלחנו לטעון את לוח המשמרות.');
      })
      .finally(() => {
        if (!cancelled) {
          setLoading(false);
        }
      });

    return () => {
      cancelled = true;
    };
  }, [navigate]);

  const handleLogout = async () => {
    await clearSession();
  };

  const handleAction = async (action) => {
    const sessionId = getSessionId();
    if (!sessionId || !action) {
      return;
    }

    let reason;
    if (action.reason_required) {
      reason = window.prompt('מה סיבת הביטול?');
      if (!reason || !reason.trim()) {
        return;
      }
    }

    const key = `${action.target}:${action.argument}`;
    setBusyAction(key);
    setError('');

    try {
      const result = await postback({
        sessionId,
        target: action.target,
        argument: action.argument,
        actionType: action.type,
        reason,
      });

      startTransition(() => {
        setData(result.data);
      });
    } catch (requestError) {
      if (isUnauthorized(requestError)) {
        await clearSession();
        return;
      }
      setError(requestError.message || 'הפעולה נכשלה.');
    } finally {
      setBusyAction('');
    }
  };

  const summary = useMemo(() => {
    if (!data) {
      return { total: 0, available: 0, occupied: 0, actionable: 0 };
    }

    const slots = flattenSlots(data.shift_blocks);
    return {
      total: slots.length,
      available: slots.filter((slot) => slot.status === 'available').length,
      occupied: slots.filter((slot) => slot.status === 'occupied').length,
      actionable: slots.filter((slot) => slot.actions.length > 0).length,
    };
  }, [data]);

  return (
    <div className="page-shell dashboard-shell">
      <header className="topbar panel">
        <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
          <img src={mdaLogo} alt="MDA Logo" style={{ height: '56px', width: 'auto' }} />
          <div className="topbar__copy">
            <span className="eyebrow">לוח משמרות</span>
            <h1>{data?.shift_type_title || 'טוען את מערכת השיבוץ'}</h1>
            <p>{data?.month_title || 'מחברים את הלקוח החדש למערכת המקורית.'}</p>
          </div>
        </div>

        <div className="topbar__actions">
          <ThemeToggle />
          <button className="ghost-button" onClick={() => loadDashboard()} disabled={loading}>
            <RefreshCcw size={16} />
            רענון
          </button>
          <button className="danger-button" onClick={handleLogout}>
            <LogOut size={16} />
            התנתקות
          </button>
        </div>
      </header>

      {loading && <LoadingScreen message="טוען את לוח המשמרות..." />}

      {!loading && (
        <>
          {error ? (
            <div className="notice notice-error">
              <AlertTriangle size={18} />
              <span>{error}</span>
            </div>
          ) : null}

          {data?.shift_type_message ? (
            <section className="panel notice notice-info">
              <Sparkles size={18} />
              <span>{data.shift_type_message}</span>
            </section>
          ) : null}

          <section className="summary-grid">
            <article className="panel summary-card">
              <CalendarDays size={20} />
              <strong>{summary.total}</strong>
              <span>תאים נטענו מהטבלה</span>
            </article>
            <article className="panel summary-card">
              <Users size={20} />
              <strong>{summary.occupied}</strong>
              <span>מקומות שכבר שובצו</span>
            </article>
            <article className="panel summary-card">
              <UserRoundCheck size={20} />
              <strong>{summary.available}</strong>
              <span>מקומות פנויים להשתבצות</span>
            </article>
            <article className="panel summary-card">
              <Clock3 size={20} />
              <strong>{summary.actionable}</strong>
              <span>פעולות זמינות מהלקוח החדש</span>
            </article>
          </section>

          {data?.calendar ? (
            <section className="panel calendar-panel">
              <div className="calendar-head">
                <div>
                  <span className="eyebrow">ניווט שבועות</span>
                  <h2>{data.calendar.month_label || 'לוח שנה'}</h2>
                </div>
                <div className="calendar-nav">
                  {data.calendar.previous ? (
                    <button
                      className="ghost-button"
                      onClick={() => handleAction(data.calendar.previous.action)}
                      disabled={busyAction === `${data.calendar.previous.action.target}:${data.calendar.previous.action.argument}`}
                    >
                      חודש קודם
                    </button>
                  ) : null}
                  {data.calendar.next ? (
                    <button
                      className="ghost-button"
                      onClick={() => handleAction(data.calendar.next.action)}
                      disabled={busyAction === `${data.calendar.next.action.target}:${data.calendar.next.action.argument}`}
                    >
                      חודש הבא
                    </button>
                  ) : null}
                </div>
              </div>

              <div className="calendar-grid">
                {data.calendar.days.map((day) => {
                  const key = day.action ? `${day.action.target}:${day.action.argument}` : day.label;
                  return (
                    <button
                      key={`${day.label}-${day.title ?? ''}`}
                      className={`calendar-day${day.selected ? ' is-selected' : ''}${day.current_month ? '' : ' is-muted'}`}
                      onClick={() => day.action && handleAction(day.action)}
                      disabled={!day.action || busyAction === key}
                      title={day.title ?? day.label}
                    >
                      <span>{day.label}</span>
                      <small>{day.title ?? ''}</small>
                    </button>
                  );
                })}
              </div>
            </section>
          ) : null}

          <section className="shift-sections">
            {data?.shift_blocks?.map((block) => (
              <article className="panel shift-section" key={`${block.title}-${block.subtitle ?? ''}`}>
                <div className="section-heading">
                  <div>
                    <span className="eyebrow">משמרת</span>
                    <h2>{block.title}</h2>
                    {block.subtitle ? <p>{block.subtitle}</p> : null}
                  </div>
                  <span className="section-count">{block.boards.length} רכבים וצוותים</span>
                </div>

                <div className="board-grid">
                  {block.boards.map((board) => (
                    <article className="board-card" key={`${block.title}-${board.name}`}>
                      <div className="board-card__head">
                        <div>
                          <h3>{board.name}</h3>
                          <p>{board.slots.filter((slot) => slot.status === 'available').length} מקומות פנויים</p>
                        </div>
                      </div>

                      <div className="slot-list">
                        {board.slots.map((slot) => {
                          const primaryAction = slot.actions[0];
                          const actionKey = primaryAction
                            ? `${primaryAction.target}:${primaryAction.argument}`
                            : `${board.name}-${slot.role}-${slot.text ?? 'locked'}`;

                          return (
                            <div
                              className={`slot-row is-${slot.status}`}
                              key={`${board.name}-${slot.role}-${slot.text ?? slot.status}-${slot.color ?? 'none'}`}
                              style={{
                                borderInlineStartColor: slot.color ?? 'var(--border-strong)',
                              }}
                            >
                              <div className="slot-main">
                                <div className="slot-main__header">
                                  <span className="role-chip">{slot.role}</span>
                                  <span className={`status-pill is-${slot.status}`}>{statusLabel(slot)}</span>
                                </div>
                                <strong>{slotHeading(slot)}</strong>
                                <p>{slotSubheading(slot)}</p>

                                {slot.details?.assigned_by || slot.details?.assigned_at || slot.details?.phone ? (
                                  <div className="slot-meta">
                                    {slot.details?.assigned_by ? <span>שובץ על ידי: {slot.details.assigned_by}</span> : null}
                                    {slot.details?.assigned_at ? <span>עודכן: {slot.details.assigned_at}</span> : null}
                                    {slot.details?.phone ? <span>טלפון: {slot.details.phone}</span> : null}
                                  </div>
                                ) : null}
                              </div>

                              {primaryAction ? (
                                <button
                                  className={`slot-action slot-action--${primaryAction.type}`}
                                  onClick={() => handleAction(primaryAction)}
                                  disabled={busyAction === actionKey}
                                >
                                  {busyAction === actionKey ? 'מעדכן...' : actionLabel(primaryAction)}
                                </button>
                              ) : null}
                            </div>
                          );
                        })}
                      </div>
                    </article>
                  ))}
                </div>
              </article>
            ))}
          </section>
        </>
      )}
    </div>
  );
}
