from abc import ABC, abstractmethod
import pandas as pd

class BaseExtractor(ABC):
    """Interfaz base para todos los extractores de bases de datos."""
    
    @abstractmethod
    def fetch_data(self, query: str) -> pd.DataFrame:
        """Método abstracto para la extracción de datos."""
        pass