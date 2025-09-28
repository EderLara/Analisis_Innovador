from sqlalchemy import create_engine
from config.config import DB_CONFIG
import pandas as pd

class SQLiteLoader: 
    """Clase para cargar datos, solo sabe cómo escribir en SQLite Target."""
    
    def __init__(self):
        # Usar la nueva clave de configuración
        self.engine = create_engine(DB_CONFIG['sqlite_target']) 

    def load_data(self, df: pd.DataFrame, table_name: str):
        print(f"-> Iniciando carga de {len(df)} registros a SQLite en tabla '{table_name}'...")
        try:
            df.to_sql(
                table_name, 
                self.engine, 
                if_exists='replace', # Usualmente se usa 'replace' o 'append' en SQLite
                index=False
            )
            print("-> Carga finalizada exitosamente en SQLite.")
        except Exception as e:
            print(f"FATAL ERROR de carga en SQLite: {e}")