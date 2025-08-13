# app.py
from flask import Flask

# Инициализация приложения Flask
app = Flask(__name__)

# Определение маршрута для корневого URL
@app.route('/')
def hello_aws():
    """
    Returns a simple greeting message.
    """
    return 'Hello, AWS! v3.0'

# Запуск приложения на порту 8080, если скрипт запущен напрямую
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
