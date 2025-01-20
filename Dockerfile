# Используем официальный образ Python 3.8
FROM python:3.8-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Устанавливаем зависимости (опционально)
# Копируем requirements.txt
COPY requirements.txt /app/
# Устанавливаем pipenv и зависимости

RUN pip install --upgrade pip && pip install -r requirements.txt
ENV PYTHONPATH=/usr/local
ENV SERVICE_HOST="0.0.0.0"
ENV SERVICE_PORT=8000

CMD uvicorn main:app --host $SERVICE_HOST --port $SERVICE_PORT
# Оставляем контейнер активным с bash
