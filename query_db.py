import sys
import os

target_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, target_dir)
import pg8000.dbapi

try:
    conn = pg8000.dbapi.connect(
        user="postgres",
        password="Pass1234",
        host="192.168.51.33",
        port=31199,
        database="postgres"
    )
    cursor = conn.cursor()
    
    cursor.execute("SELECT id, worker_id, is_blocklisted, embedding_hash FROM face_embeddings;")
    faces = cursor.fetchall()
    print("\nFace Embeddings:")
    for f in faces:
        print(f" - ID: {f[0]}, Worker ID: {f[1]}, Blocklisted: {f[2]}, Hash: {f[3]}")
        
except Exception as e:
    print(f"Error querying database: {e}")
