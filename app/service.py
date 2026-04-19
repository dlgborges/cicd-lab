from app.db import fetch_users

def get_status():
    return {"status": "Hello from 3-tier app"}

def get_users():
    users = fetch_users()
    return {"users": users}
