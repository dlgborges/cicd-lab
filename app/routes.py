from fastapi import APIRouter
from app.service import get_status, get_users

router = APIRouter()

@router.get("/")
def root():
    return get_status()

@router.get("/health")
def health():
    return {"status": "ok"}

@router.get("/users")
def users():
    return get_users()

@router.get("/error")
def error():
    raise Exception("forced error")