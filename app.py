from flask import Flask
from prometheus_client import Counter, start_http_server

app = Flask(__name__)

# تعریف معیار برای تعداد درخواست‌ها
http_requests_total = Counter('http_requests_total', 'Total HTTP Requests', ['endpoint'])

# راه‌اندازی سرور Prometheus برای ارائه معیارها
start_http_server(8001)  # پورت 8001 برای معیارها

@app.route('/')
def home():
    http_requests_total.labels(endpoint='/').inc()  # افزایش شمارش برای مسیر /
    return """
    <html>
    <head>
        <title>نادین سافت</title>
        <meta charset="utf-8">
        <style>
            body { font-family: Tahoma, Arial, sans-serif; text-align: center; margin-top: 100px; }
            h1 { color: #2c3e50; }
        </style>
    </head>
    <body>
        <h1>سلام به تمامی کارمندان شرکت نادین سافت</h1>
        <p>این سرویس روی آدرس IP: <strong>192.168.83.7</strong> در حال اجراست.</p>
    </body>
    </html>
    """

@app.route('/health')
def health():
    http_requests_total.labels(endpoint='/health').inc()  # افزایش شمارش برای مسیر /health
    return {"status": "healthy"}, 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

