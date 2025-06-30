# Usar imagen base de Python
FROM python:3.11-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar requirements
COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la aplicación
COPY app_core.py .

# Exponer puerto 8501
EXPOSE 8501

# CONFIGURAR STREAMLIT
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0

# EJECUTAR APLICACIÓN
CMD ["streamlit", "run", "app_core.py", "--server.port=8501", "--server.address=0.0.0.0"]
