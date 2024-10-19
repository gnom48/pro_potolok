# FROM devries/bottle

# COPY requirements.txt requirements.txt

# EXPOSE 5555

# ADD . /app
# WORKDIR /app

# CMD ["gunicorn","-b","0.0.0.0:5555","-w","3","--log-file","-","--log-level","debug","--access-logfile","-","app:app"]

# Используем официальный образ Python
# FROM python:3.9-slim
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код приложения в контейнер
COPY . .

# Открываем порт 5555
EXPOSE 5555

# Команда для запуска приложения
CMD ["gunicorn", "-b", "0.0.0.0:5555", "-w", "3", "--log-file", "-", "--log-level", "debug", "--access-logfile", "-", "app:app"]
