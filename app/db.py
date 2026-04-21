import os
import psycopg2

def get_conn():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "postgres"),
        dbname=os.getenv("DB_NAME", "appdb"),
        user=os.getenv("DB_USER", "appuser"),
        password=os.getenv("DB_PASSWORD", "apppass"),
        port=os.getenv("DB_PORT", "5432"),
        connect_timeout=5
    )

def fetch_users():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT pg_sleep(8);")

    cur.execute("""
        CREATE TABLE IF NOT EXISTS users (
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL
        )
    """)
    cur.execute("SELECT COUNT(*) FROM users;")
    count = cur.fetchone()[0]
    
    if count == 0:
        cur.execute("INSERT INTO users (name) VALUES (%s)",("Alice",))
        cur.execute("INSERT INTO users (name) VALUES (%s)",("Bob",))
    
    conn.commit()
    
    cur.execute("SELECT id, name FROM users ORDER BY id;")
    rows = cur.fetchall()

    cur.close()
    conn.close()
    
    return [{"id": r[0], "name": r[1]} for r in rows]
