import asyncio
import logging
import sys

# Force ProactorEventLoop on Windows to support subprocesses (required by Playwright)
if sys.platform == 'win32':
    asyncio.set_event_loop_policy(asyncio.WindowsProactorEventLoopPolicy())

# Configure logging so service debug messages are visible
logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(name)s] %(levelname)s: %(message)s")

from mada_api.app import create_app

app = create_app()

if __name__ == "__main__":
    import uvicorn
    # NOTE: On Windows, uvicorn's --reload flag forces the SelectorEventLoop, 
    # which is incompatible with Playwright (raises NotImplementedError).
    # To enable reloading on Windows, use an external watcher like watchfiles:
    #   pip install watchfiles
    #   watchfiles "python main.py"
    
    is_windows = sys.platform == 'win32'
    uvicorn.run(
        "main:app", 
        host="127.0.0.1", 
        port=8000, 
        reload=not is_windows,
        loop="asyncio" if is_windows else "auto"
    )
