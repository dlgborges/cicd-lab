from fastapi import APIRouter
from app.service import get_status, get_users

router = APIRouter()

@router.get("/")
def root():
    """
    Rota raiz que retorna o status do sistema.

    Returns:
        dict: Dicionário contendo o status do sistema.
    """
    return get_status()

@router.get("/health")
def health():
    """
    Rota de saúde para verificar se a aplicação está funcionando corretamente.

    Returns:
        dict: Dicionário com um status "ok" indicando que a aplicação está funcionando normalmente.
    """
    return {"status": "ok"}

@router.get("/users")
def users():
    """
    Rota que retorna uma lista de usuários.

    Returns:
        list: Lista de usuários retornada pelo serviço.
    """
    return get_users()

@router.get("/error")
def error():
    """
    Rota que força um erro para fins de teste ou demonstração.

    Raises:
        Exception: Exceção forçada com a mensagem "forced error".
    """
    raise Exception("forced error")
