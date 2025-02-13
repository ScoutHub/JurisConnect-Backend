from fastapi.testclient import TestClient
from .main import app

client = TestClient(app)


def test_read_parts():
    response = client.get("/code_civil/parts", headers={"X-API-KEY": "coneofsilence"})
    assert response.status_code == 200
    assert response.json() == [
        {"id": 1, "title": "Default Path"},
        {"id": 10, "title": "Livre IV : Des sûretés"},
    ]
    
def test_read_global_item_bad_token():
    response = client.get("/code_civil/parts", headers={"X-API-KEY": "hailhydra"})
    assert response.status_code == 400
    assert response.json() == {"detail": "Could not validate credentials"}
    
    
def test_read_item():
    response = client.get("/code_civil/parts/2", headers={"X-API-KEY": "coneofsilence"})
    assert response.status_code == 200
    assert response.json() == {"id": 10, "title": "Livre IV : Des sûretés"}


def test_read_item_bad_token():
    response = client.get("/code_civil/parts/1", headers={"X-API-KEY": "hailhydra"})
    assert response.status_code == 400
    assert response.json() == {"detail": "Could not validate credentials"}


def test_read_nonexistent_item():
    response = client.get("/code_civil/parts/99", headers={"X-API-KEY": "coneofsilence"})
    assert response.status_code == 404
    assert response.json() == {"detail": "Item not found"}
