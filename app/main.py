from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "Hello CI/CD Pipeline"}

# 👇 THIS is the key part
Instrumentator().instrument(app).expose(app)