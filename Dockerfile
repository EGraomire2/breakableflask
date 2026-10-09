FROM python:3.9-slim

WORKDIR /app

# Création d'un utilisateur non-root
RUN useradd -m appuser

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Basculer vers l'utilisateur non-root
USER appuser

EXPOSE 4000

CMD ["python", "main.py"]
