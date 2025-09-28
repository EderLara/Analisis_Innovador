from sqlalchemy import create_engine
from interfaces.interfaces import BaseExtractor
from config.config import DB_CONFIG
import pandas as pd
from typing import Dict, Any

class GenericExtractor(BaseExtractor):
    """Clase base que implementa la lógica común de extracción de SQL."""
    def __init__(self, db_key: str):
        self.engine = create_engine(DB_CONFIG[db_key])

    def fetch_data(self, query: str) -> pd.DataFrame:
        print(f"-> Extrayendo datos desde: {self.engine.name}")
        try:
            df = pd.read_sql(query, self.engine)
            print(f"-> Extracción exitosa. Filas: {len(df)}")
            return df
        except Exception as e:
            print(f"ERROR de extracción en {self.engine.name}: {e}")
            return pd.DataFrame()

# Clases específicas que implementan la interfaz (LSP)
class MySqlSourceExtractor(GenericExtractor):
    def __init__(self):
        super().__init__("mysql_source")

class OracleExtractor(GenericExtractor):
    def __init__(self):
        super().__init__("oracle")

class PostgresExtractor(GenericExtractor):
    def __init__(self):
        super().__init__("postgres")

class SqlServerExtractor(GenericExtractor):
    def __init__(self):
        super().__init__("sqlserver")

class MariaDBExtractor(GenericExtractor):
    def __init__(self):
        super().__init__("mariadb")