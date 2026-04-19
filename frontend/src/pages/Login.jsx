import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  ArrowLeft,
  CalendarDays,
  Lock,
  ShieldCheck,
  User,
  Workflow,
  Mail,
  MessageSquare,
  Check,
} from 'lucide-react';

import { login, SESSION_STORAGE_KEY } from '../lib/api';
import mdaLogo from '../assets/images/logo-mda-white.png';

import ThemeToggle from '../components/ThemeToggle';
import LoadingScreen from '../components/LoadingScreen';

export default function Login() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [captchaText, setCaptchaText] = useState('');
  const [captchaImage, setCaptchaImage] = useState(null);
  const [unauthSessionId, setUnauthSessionId] = useState(null);
  const [is2faRequired, setIs2faRequired] = useState(false);
  const [maskedEmail, setMaskedEmail] = useState('');
  const [otpCode, setOtpCode] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [smsRequested, setSmsRequested] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    if (localStorage.getItem(SESSION_STORAGE_KEY)) {
      navigate('/dashboard', { replace: true });
    }
  }, [navigate]);

  const handleLogin = async (event) => {
    event.preventDefault();
    setLoading(true);
    setError('');

    try {
      const data = await login(username, password, captchaText, unauthSessionId, otpCode, false);
      localStorage.setItem(SESSION_STORAGE_KEY, data.session_id);
      navigate('/dashboard');
    } catch (requestError) {
      if (requestError.status === 403 && requestError.payload?.detail?.error === 'captcha_required') {
        setError(requestError.payload.detail.message || 'נדרש אימות בוטים (CAPTCHA).');
        setCaptchaImage(requestError.payload.detail.captcha_image);
        if (requestError.payload.detail.session_id) {
          setUnauthSessionId(requestError.payload.detail.session_id);
        }
      } else if (requestError.status === 403 && requestError.payload?.detail?.error === '2fa_required') {
        const msg = requestError.payload.detail.message;
        if (msg !== 'A 2FA code is required.' && msg !== 'SMS code requested.') {
          setError(msg);
        } else {
          setError('');
        }
        setIs2faRequired(true);
        setMaskedEmail(requestError.payload.detail.masked_email);
        if (requestError.payload.detail.session_id) {
          setUnauthSessionId(requestError.payload.detail.session_id);
        }
        setCaptchaImage(null);
      } else {
        setError(requestError.message || 'ההתחברות נכשלה. נסו שוב בעוד רגע.');
        setCaptchaImage(null);
        setIs2faRequired(false);
        setUnauthSessionId(null);
      }
      setCaptchaText('');
      setOtpCode('');
    } finally {
      setLoading(false);
    }
  };

  const handleRequestSms = async () => {
    if (smsRequested) return;
    setLoading(true);
    setError('');
    try {
      await login(username, password, captchaText, unauthSessionId, null, true);
      setSmsRequested(true);
    } catch (requestError) {
      if (requestError.status === 403 && requestError.payload?.detail?.error === '2fa_required') {
        const msg = requestError.payload.detail.message;
        if (msg && msg !== 'SMS code requested.') {
          setError(msg);
        } else {
          setSmsRequested(true);
          setError('קוד נשלח בסמס, אנא הזינו אותו כעת.');
        }
      } else {
        setError(requestError.message || 'שגיאה בבקשת קוד בסמס.');
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="page-shell login-shell">
      {loading && <LoadingScreen message={is2faRequired ? "מאמת קוד..." : "מתחבר למערכת..."} />}
      <section className="panel auth-card">
        <div className="auth-card__header">
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
              <img src={mdaLogo} alt="Logo" style={{ height: '42px', width: 'auto' }} />
              <div>
                <span className="eyebrow">התחברות</span>
                <h2>מד״א ירושלים</h2>
              </div>
            </div>
            <ThemeToggle />
          </div>
          <p style={{ marginTop: '0.45rem' }}>הזינו את פרטי המשתמש שלכם מmda101.org.</p>
        </div>

        {error ? <div className="notice notice-error">{error}</div> : null}

        <form className="auth-form" onSubmit={handleLogin}>
          {is2faRequired ? (
            <div className="captcha-block" style={{ marginTop: '0.5rem', background: 'var(--surface-sunken)', padding: '1.25rem', borderRadius: 'var(--radius-md)', border: '1px solid var(--border)', display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
              <div style={{ textAlign: 'center', marginBottom: '0.5rem' }}>
                <div style={{ fontWeight: '500', marginBottom: '0.25rem', fontSize: '1.1rem', color: 'var(--text)' }}>אימות דו שלבי נדרש</div>
                <div style={{ fontSize: '0.9rem', color: 'var(--text-muted)' }}>
                  קוד אימות נשלח לכתובת:
                  <br />
                  <strong style={{ color: 'var(--text)' }} dir="ltr">{maskedEmail || 'דוא"ל במערכת'}</strong>
                </div>
              </div>
              <label className="field" style={{ margin: 0 }}>
                <span className="field-label">
                  <Mail size={16} />
                  קוד אימות
                </span>
                <input
                  type="text"
                  value={otpCode}
                  onChange={(e) => setOtpCode(e.target.value.replace(/[^0-9]/g, ''))}
                  placeholder="הזן את 6 הספרות"
                  required={is2faRequired}
                  disabled={loading}
                  dir="ltr"
                  maxLength={6}
                  inputMode="numeric"
                />
              </label>
              <div style={{ display: 'flex', marginTop: '0.25rem' }}>
                <button 
                  type="button" 
                  className="primary-button" 
                  onClick={handleRequestSms}
                  disabled={loading || smsRequested} 
                  style={{ 
                    width: '100%', 
                    display: 'flex', 
                    alignItems: 'center', 
                    justifyContent: 'center', 
                    gap: '0.6rem',
                    background: smsRequested ? 'var(--success)' : 'linear-gradient(135deg, #6e5d4d 0%, #4f3a29 100%)',
                    boxShadow: smsRequested ? '0 12px 32px var(--success-soft)' : '0 12px 32px rgba(79, 58, 41, 0.15)',
                    padding: '1rem 1.25rem',
                    transition: 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)'
                  }}
                >
                  {smsRequested ? <Check size={18} /> : <MessageSquare size={18} />}
                  <span style={{ fontWeight: '700' }}>{smsRequested ? 'קוד נשלח לסמס' : 'שלח קוד ב-SMS'}</span>
                </button>
              </div>
            </div>
          ) : (
            <>
              <label className="field">
                <span className="field-label">
                  <User size={16} />
                  שם משתמש
                </span>
                <input
                  type="text"
                  value={username}
                  onChange={(event) => setUsername(event.target.value)}
                  placeholder="user"
                  required={!is2faRequired}
                  disabled={loading}
                  dir="ltr"
                />
              </label>

              <label className="field">
                <span className="field-label">
                  <Lock size={16} />
                  סיסמה
                </span>
                <input
                  type="password"
                  value={password}
                  onChange={(event) => setPassword(event.target.value)}
                  placeholder="password123"
                  required={!is2faRequired}
                  disabled={loading}
                  dir="ltr"
                />
              </label>
              
              {captchaImage && (
                <div className="captcha-block" style={{ marginTop: '1rem', background: 'var(--surface-sunken)', padding: '1rem', borderRadius: 'var(--radius-md)', border: '1px solid var(--border)', display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                  <div style={{ display: 'flex', justifyContent: 'center' }}>
                    <img 
                      src={`data:image/png;base64,${captchaImage}`} 
                      alt="CAPTCHA" 
                      style={{ border: '1px solid var(--border)', borderRadius: '4px' }}
                    />
                  </div>
                  <label className="field" style={{ margin: 0 }}>
                    <span className="field-label">
                      <ShieldCheck size={16} />
                      קוד אבטחה
                    </span>
                    <input
                      type="text"
                      value={captchaText}
                      onChange={(e) => setCaptchaText(e.target.value)}
                      placeholder="הקלידו את התווים מהתמונה"
                      required={!is2faRequired}
                      disabled={loading}
                      dir="ltr"
                    />
                  </label>
                </div>
              )}
            </>
          )}

          <button 
            className="primary-button" 
            type="submit" 
            disabled={loading || (is2faRequired && otpCode.length < 6)} 
            style={{ marginTop: captchaImage ? '1rem' : '0', display: 'flex', width: '100%', justifyContent: 'center', gap: '0.5rem', alignItems: 'center' }}
          >
            <span>{loading ? 'מתחבר...' : is2faRequired ? 'המשך' : 'כניסה למערכת'}</span>
            <ArrowLeft size={16} />
          </button>
        </form>
      </section>
    </div>
  );
}
