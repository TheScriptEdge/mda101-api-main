# MADA Python Server

FastAPI + Playwright backend for the new `mad101.org` client.

## Run

```powershell
py -3.10 -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
playwright install chromium
python .\main.py
```

## Environment

- `MADA_BASE_URL` defaults to `https://mda101.org`
- `MADA_FRONTEND_ORIGINS` defaults to `http://localhost:5173,http://127.0.0.1:5173`
- `MADA_HEADLESS` defaults to `true`
- `MADA_TIMEOUT_MS` defaults to `45000`
