from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI()

@app.get("/")
def read_root():
    return {"status": "Hello CI/CD Pipeline"}

@app.get("/error")
def error():
    raise Exception("forced error")

# 👇 THIS is the key part
Instrumentator().instrument(app).expose(app)