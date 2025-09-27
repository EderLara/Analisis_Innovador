import pandas as pd
from typing import List

def standardize_columns(df: pd.DataFrame, source_name: str) -> pd.DataFrame:
    """Estandariza los nombres de columnas a un formato único (ej. minúsculas)."""
    df.columns = [col.lower().replace(' ', '_') for col in df.columns]
    print(f"-> Columnas estandarizadas para {source_name}.")
    
    # Mapeo de columnas para el target final (ejemplo)
    column_map = {
        'num_identificacion': 'customer_id',
        'fec_venta': 'sale_date',
        'valor_total': 'amount',
        # ... más mapeos
    }
    df.rename(columns=column_map, inplace=True)
    return df

def clean_and_cast_data(df: pd.DataFrame) -> pd.DataFrame:
    """Limpia nulos y convierte tipos de datos."""
    
    # Ejemplo de limpieza: convertir 'amount' a numérico
    if 'amount' in df.columns:
        df['amount'] = pd.to_numeric(df['amount'], errors='coerce')
        df.dropna(subset=['amount'], inplace=True) # Elimina filas con 'amount' nulo tras coerción
        
    # Añadir columna de origen (útil para la auditoría)
    if 'source_db' not in df.columns:
         df['source_db'] = 'unknown' # Esta debe ser llenada en el Notebook principal
         
    return df