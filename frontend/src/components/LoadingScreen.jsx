import mdaLogo from '../assets/images/logo-mda-white.png';

export default function LoadingScreen({ message = "טוען..." }) {
  return (
    <div className="loading-overlay">
      <img src={mdaLogo} alt="MDA Logo" className="loading-logo" />
      <div className="loading-bar-container">
        <div className="loading-bar"></div>
      </div>
      <p style={{ marginTop: '1.5rem', color: 'var(--text-soft)', fontWeight: '500' }}>{message}</p>
    </div>
  );
}
