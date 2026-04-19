# mda101.org custom Client 

* work in progress~(have some stuff missing and some bugs)
playwright api for mda101.org enjoy :) 



### 1. Backend Setup
go to the `backend` directory and install dependencies:
```bash
cd backend
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
playwright install chromium
```
Run the backend:
```bash
python main.py
```

### 2. Frontend Setup
go to the `frontend` directory and install dependencies:
```bash
cd frontend
npm install
```
Run the frontend:
```bash
npm run dev
```


##  License
This project is licensed under the MIT License.
