# test/test_app.py
import pytest
from app import app

@pytest.fixture
def client():
    """ایجاد یک کلاینت تست برای Flask"""
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_page(client):
    """تست صفحه اصلی"""
    response = client.get('/')
    assert response.status_code == 200
    assert "سلام به تمامی کارمندان شرکت نادین سافت" in response.get_data(as_text=True)

def test_health_check(client):
    """تست endpoint /health"""
    response = client.get('/health')
    assert response.status_code == 200
    json_data = response.get_json()
    assert json_data == {"status": "healthy"}

def test_response_content_type(client):
    """تست نوع محتوا (Content-Type)"""
    response = client.get('/')
    assert response.content_type == "text/html; charset=utf-8"
