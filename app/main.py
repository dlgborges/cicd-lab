from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
from app.routes import router

app = FastAPI(title="3-Tier Lab")
app.include_router(router)

# 👇 THIS is the key part
Instrumentator().instrument(app).expose(app)



