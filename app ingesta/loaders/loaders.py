from sqlalchemy import create_engine
from config.config import DB_CONFIG
import pandas as pd

class MySqlLoader:
    """Clase para cargar datos, solo sabe cómo escribir en MySQL Target."""
    
    def __init__(self):
        self.engine = create_engine(DB_CONFIG['mysql_target'])

    def load_data(self, df: pd.DataFrame, table_name: str):
        print(f"-> Iniciando carga de {len(df)} registros a MySQL en tabla '{table_name}'...")
        try:
            df.to_sql(
                table_name, 
                self.engine, 
                if_exists='append', # o 'replace' si se requiere
                index=False
            )
            print("-> Carga finalizada exitosamente.")
        except Exception as e:
            print(f"FATAL ERROR de carga en MySQL: {e}")