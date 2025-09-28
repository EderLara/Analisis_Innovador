"""
    Este archivo contiene los strings de conexión de la base de datos.
"""

# config.py

DB_CONFIG = {
    # Fuentes de Datos (Añadir MariaDB, Quitar SQLite como fuente)
    "mysql_source": "mysql+mysqlconnector://user:secret@localhost:3306/tienda_mx",
    "oracle": "oracle+oracledb://appuser:appuserpwd@localhost:1521/?service_name=XEPDB1",
    "postgres": "postgresql+psycopg2://user:secret@localhost:5432/almacen_pg",
    "sqlserver": "mssql+pyodbc://sa:StrongP@ssword1@127.0.0.1:1433/ventas_sql?driver=ODBC+Driver+17+for+SQL+Server",
    "mariadb": "mariadb+mariadbconnector://user_maria:secret_maria@localhost:3307/tienda_maria", 
    
    # Destino de Carga 
    "sqlite_target": "sqlite:///data/ventas_consolidado.db" # SQLite como destino
}

