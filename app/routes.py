from fastapi import APIRouter
from app.service import get_status, get_users

router = APIRouter()

@router.get("/")
def root():
    """
    Root route that returns the system status.

    Returns:
        dict: Dictionary containing the system status.
    """
    return get_status()

@router.get("/health")
def health():
    """
    Health check route to verify if the application is working correctly.

    Returns:
        dict: Dictionary with a "status" key set to "ok", indicating that the application is functioning normally.
    """
    return {"status": "ok"}

@router.get("/users")
def users():
    """
    Route that returns a list of users.

    Returns:
        list: List of users returned by the service.
    """
    return get_users()

@router.get("/error")
def error():
    """
    Route that forces an error for testing or demonstration purposes.

    Raises:
        Exception: Forced exception with the message "forced error".
    """
    raise Exception("forced error")
