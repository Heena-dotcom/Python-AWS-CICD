from app import app

with app.test_client() as client:
    response = client.get('/')
    assert response.status_code == 200
    print("Flask test passed!")
