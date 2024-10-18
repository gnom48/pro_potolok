import bottle
import os
import sys
from bottle import static_file, request, response, run, Bottle
from datetime import datetime
import csv
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import schedule
import time
import threading
import math

# Включение режима отладки, если задано
if '--debug' in sys.argv[1:] or 'SERVER_DEBUG' in os.environ:
    bottle.debug(True)

app = bottle.Bottle()

# Путь к файлу для хранения данных о посетителях
FILE_NAME = 'visitors.csv'

# Инициализация файла для хранения данных о посетителях (если файл не существует)
if not os.path.exists(FILE_NAME):
    with open(FILE_NAME, mode='w', newline='') as file:
        writer = csv.writer(file)
        # Запись заголовков столбцов
        writer.writerow(["IP", "Начало сеанса", "Окончание сеанса", "Время на сайте (секунды)"])
    print(f"Создан файл {FILE_NAME}.")

# Маршрут для главной страницы, где будет показана основная страница index.html
@app.route('/')
def index():
    client_ip = request.remote_addr
    visit_time = datetime.now()

    print(f"Посетитель {client_ip} зашел на сайт в {visit_time}.")

    # Запись визита в файл
    try:
        with open(FILE_NAME, mode='a', newline='') as file:
            writer = csv.writer(file)
            writer.writerow([client_ip, visit_time.strftime("%Y-%m-%d %H:%M:%S"), '', ''])
        print(f"Запись визита для {client_ip} успешно сохранена.")
    except Exception as e:
        print(f"Ошибка при записи в файл: {e}")

    # Установка cookie для отслеживания времени на сайте
    response.set_cookie("session_start", visit_time.strftime("%Y-%m-%d %H:%M:%S.%f"))

    # Отображение основной страницы (index.html)
    return static_file('index.html', root=os.path.join(os.path.abspath(os.path.dirname(__file__)), 'views'))

# Маршрут для завершения сессии
@app.route('/goodbye', method=['GET', 'POST'])
def goodbye():
    session_start = request.get_cookie("session_start")
    if session_start:
        try:
            start_time = datetime.strptime(session_start, "%Y-%m-%d %H:%M:%S.%f")
            time_spent = datetime.now() - start_time
            time_spent_seconds = time_spent.total_seconds()
        except ValueError:
            start_time = None
            time_spent_seconds = 0

        client_ip = request.remote_addr
        end_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        # Обновление последней записи для этого IP
        updated = False
        rows = []
        if os.path.exists(FILE_NAME):
            with open(FILE_NAME, mode='r', newline='') as file:
                reader = csv.reader(file)
                for row in reader:
                    if row[0] == client_ip and row[2] == '':
                        row[2] = end_time
                        row[3] = str(time_spent_seconds)
                        updated = True
                    rows.append(row)

        if updated:
            with open(FILE_NAME, mode='w', newline='') as file:
                writer = csv.writer(file)
                writer.writerows(rows)
            print(f"Обновлена запись для {client_ip} с временем выхода {end_time} и временем на сайте {time_spent_seconds} секунд.")
        else:
            # Если запись не найдена, создаем новую
            with open(FILE_NAME, mode='a', newline='') as file:
                writer = csv.writer(file)
                writer.writerow([client_ip, '', end_time, time_spent_seconds])
            print(f"Создана новая запись для {client_ip} с временем выхода {end_time} и временем на сайте {time_spent_seconds} секунд.")
    return ""

# Функция для отправки отчета по почте каждые 24 часа на два email
def send_email_report():
    if not os.path.exists(FILE_NAME):
        print("Файл с данными о посетителях не найден.")
        return

    rows = []
    report = ""
    total_visitors = 0  # Счетчик уникальных посетителей
    unique_ips = set()  # Множество для хранения уникальных IP-адресов

    # Чтение данных о посетителях
    with open(FILE_NAME, mode='r', newline='') as file:
        reader = csv.reader(file)
        # Пропускаем заголовок
        next(reader)
        for row in reader:
            unique_ips.add(row[0])  # Добавляем IP-адрес в множество уникальных посетителей
            
            # Если сеанс не завершен (нет времени выхода), вычисляем текущее время на сайте
            if row[2] == '':
                session_start = datetime.strptime(row[1], "%Y-%m-%d %H:%M:%S")
                time_spent = datetime.now() - session_start
                time_spent_seconds = math.ceil(time_spent.total_seconds())  # Округляем вверх
                row[3] = str(time_spent_seconds)
                row[2] = "Сеанс не завершен"
            else:
                # Преобразуем значение в целое число только если оно действительно является числом
                try:
                    time_spent_seconds = int(row[3])  # Получаем время, если сеанс завершен
                except ValueError:
                    print(f"Ошибка преобразования времени на сайте для IP {row[0]}: {row[3]}")
                    time_spent_seconds = 0  # Или любое значение по умолчанию

            rows.append(row)

            # Формируем отчет
            report += f"Посетитель {row[0]} провел на сайте {time_spent_seconds} секунд. Статус: {row[2]}.\n"


    total_visitors = len(unique_ips)  # Общее количество уникальных посетителей

    # Добавляем общее количество посетителей в начало отчета
    report = f"Общее количество посетителей Pro Потолок: {total_visitors}\n\n" + report

    # Отправка email с отчетом
    sender_email = "dinardarsky@yandex.ru"
    receiver_emails = ["dinardarskii@yandex.ru", "egorchima@gmail.com"]  # Список email получателей
    password = "zvcgbanemxayvdpn"

    for receiver_email in receiver_emails:
        message = MIMEMultipart()
        message["From"] = sender_email
        message["To"] = receiver_email
        message["Subject"] = "Ежедневный отчет о посетителях"

        message.attach(MIMEText(report, "plain"))

        try:
            # Настройка SMTP-сервера
            server = smtplib.SMTP_SSL('smtp.yandex.ru', 465)
            server.login(sender_email, password)
            server.sendmail(sender_email, receiver_email, message.as_string())
            server.quit()
            print(f"Отчет успешно отправлен на {receiver_email}.")
        except Exception as e:
            print(f"Ошибка при отправке на {receiver_email}: {e}")

    # Удаление файла после успешной отправки отчета
    try:
        os.remove(FILE_NAME)
        print(f"Файл {FILE_NAME} успешно удален.")
    except Exception as e:
        print(f"Ошибка при удалении файла {FILE_NAME}: {e}")

# Планирование отправки отчета в 12:01 каждый день
schedule.every().day.at("09:00").do(send_email_report)

# Фоновая задача для выполнения планировщика
def run_scheduler():
    while True:
        schedule.run_pending()
        time.sleep(60)

# Запуск планировщика в отдельном потоке
scheduler_thread = threading.Thread(target=run_scheduler, daemon=True)
scheduler_thread.start()

# Запуск статических файлов (если необходимо)
@app.route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root=os.path.join(os.path.abspath(os.path.dirname(__file__)), 'static'))

# Запуск приложения Bottle
if __name__ == '__main__':
    PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
    STATIC_ROOT = os.path.join(PROJECT_ROOT, 'static').replace('\\', '/')
    HOST = os.environ.get('SERVER_HOST', 'localhost')
    try:
        PORT = int(os.environ.get('SERVER_PORT', '5555'))
    except ValueError:
        PORT = 5555

    run(app=app, host='localhost', port=8080, debug=True)
