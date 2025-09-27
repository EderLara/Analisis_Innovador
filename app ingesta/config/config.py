"""
    Este archivo contiene los strings de conexión de la base de datos.
"""

DB_CONFIG = {
    "mysql_source": "mysql+mysqlconnector://user:pass@host:port/source_db",
    "oracle": "oracle+cx_oracle://user:pass@host:port/?service_name=SID",
    "postgres": "postgresql+psycopg2://user:pass@host:port/db_name",
    "sqlserver": "mssql+pyodbc://user:pass@host:port/db_name?driver=ODBC+Driver+17+for+SQL+Server",
    "sqlite": "sqlite:///data/sqlite_ventas.db",
    "mysql_target": "mysql+mysqlconnector://target_user:target_pass@target_host:target_port/target_db" 
}