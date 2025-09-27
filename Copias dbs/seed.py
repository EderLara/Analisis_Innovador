import sqlite3
import random
from datetime import datetime, timedelta

# --- Configuración de la Base de Datos y la Data ---
DATABASE_FILE = "db.sqlite"
NUM_REGISTROS = 10000

# Parámetros para las IDs (determinan cuántos registros de referencia se crearán)
NUM_PRODUCTOS = 100
NUM_CLIENTES = 20
NUM_AGENTES = 10
NUM_TIENDAS = 5
NUM_MODO_PAGO = 3

def initialize_database(conn):
    """Crea las tablas de referencia necesarias si no existen y las puebla."""
    cursor = conn.cursor()

    # 1. Crear Tablas de Referencia (solo con ID para este ejemplo)
    print("Creando tablas de referencia (producto, cliente, agente, tienda, modo_pago)...")
    
    # Define las tablas de referencia
    ref_tables = {
        'producto': NUM_PRODUCTOS,
        'cliente': NUM_CLIENTES,
        'agente': NUM_AGENTES,
        'tienda': NUM_TIENDAS,
        'modo_pago': NUM_MODO_PAGO
    }
    
    # Crear y poblar las tablas de referencia
    for table, count in ref_tables.items():
        cursor.execute(f"DROP TABLE IF EXISTS {table}")
        cursor.execute(f"CREATE TABLE {table} (id INTEGER PRIMARY KEY, nombre TEXT)")
        # Insertar datos básicos para que existan las IDs
        data = [(i + 1, f'{table.capitalize()} {i+1}') for i in range(count)]
        cursor.executemany(f"INSERT INTO {table} (id, nombre) VALUES (?, ?)", data)

    # 2. Nota: La creación de la tabla 'registro' ha sido omitida por solicitud.
    # Se asume que la tabla 'registro' ya existe con la estructura correcta.

    conn.commit()

def generate_data():
    """Genera 10,000 registros de ventas como una lista de tuplas."""
    data_to_insert = []
    
    # Fecha de inicio para simular las ventas
    start_date = datetime(2018, 1, 1)

    print(f"Generando {NUM_REGISTROS} registros...")

    for i in range(NUM_REGISTROS):
        # La lógica de generación se basa en tu ejemplo
        
        # Simulación de fecha: Usamos una fecha en Enero de 2018 con un poco de variación
        days_offset = i // (NUM_REGISTROS // 30) # Distribuye las ventas a lo largo del mes
        current_date = (start_date + timedelta(days=days_offset)).strftime('%Y-%m-%d')
        
        id_producto = (i % NUM_PRODUCTOS) + 1
        id_cliente = (i % NUM_CLIENTES) + 1
        id_agente = (i % NUM_AGENTES) + 1
        id_tienda = (i % NUM_TIENDAS) + 1
        id_modo_pago = (i % NUM_MODO_PAGO) + 1
        cantidad = (i % 5) + 1 # Cantidad entre 1 y 5
        
        # Simulación de total: Valor con decimales, similar a tu lógica
        total = round(2 + (i % 50) + random.uniform(0.1, 0.99), 2)
        
        # Crear la tupla de datos
        row = (
            current_date,
            id_producto,
            id_cliente,
            id_agente,
            id_tienda,
            id_modo_pago,
            cantidad,
            total
        )
        data_to_insert.append(row)
        
    return data_to_insert

def insert_data(conn, data):
    """Inserta los datos generados en la tabla 'registro' usando executemany."""
    cursor = conn.cursor()
    
    # La instrucción SQL con placeholders (?)
    sql_insert = """
        INSERT INTO registro (fecha, id_producto, id_cliente, id_agente, id_tienda, id_modo_pago, cantidad, total) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    """
    
    print("Insertando datos en la tabla 'registro'...")
    cursor.executemany(sql_insert, data)
    
    # Confirmar la transacción
    conn.commit()
    print(f"¡Éxito! Se insertaron {cursor.rowcount} registros.")

def main():
    """Función principal para conectar, preparar, generar e insertar."""
    try:
        # Conectar a la base de datos (o crearla si no existe)
        conn = sqlite3.connect(DATABASE_FILE)
        
        # Configurar la BD y crear las tablas
        # Solo se crean las tablas de referencia aquí.
        initialize_database(conn) 
        
        # Generar los 10,000 registros
        sales_data = generate_data()
        
        # Insertar los datos generados
        insert_data(conn, sales_data)
        
    except sqlite3.Error as e:
        print(f"Ocurrió un error de SQLite: {e}")
            
    finally:
        if conn:
            conn.close()
            print(f"Conexión a '{DATABASE_FILE}' cerrada.")

if __name__ == "__main__":
    main()
