import requests

BASE_URLS = {
    "owners": "http://localhost/api/owners",
    "franchises": "http://localhost/api/franchises",
    "movies": "http://localhost/api/movies",
    "cast-members": "http://localhost/api/cast-members",
    "boxoffice": "http://localhost/api/boxoffice",
    "images": "http://localhost/api/images"
}

def test_health():
    for service, url in BASE_URLS.items():
        try:
            response = requests.get(f"{url}/health")
            print(f"✅ {service}: {response.status_code} - {response.text}")
        except Exception as e:
            print(f"❌ {service}: {e}")

def test_crud():
    # Test Owner API
    owner_data = {
        "name": "Paramount Pictures",
        "founded_year": 1912,
        "headquarters": "Hollywood, California"
    }
    
    response = requests.post(f"{BASE_URLS['owners']}/api/owners", json=owner_data)
    if response.status_code == 201:
        owner = response.json()
        print(f"✅ Created owner: {owner['name']}")
        
        # Test Franchise API with this owner
        franchise_data = {
            "name": "Mission: Impossible",
            "owner_id": owner['id'],
            "description": "Action spy film series",
            "year_established": 1996
        }
        
        response = requests.post(f"{BASE_URLS['franchises']}/api/franchises", json=franchise_data)
        if response.status_code == 201:
            franchise = response.json()
            print(f"✅ Created franchise: {franchise['name']}")
            
            # Continue with other APIs...
        else:
            print("❌ Failed to create franchise")
    else:
        print("❌ Failed to create owner")

if __name__ == "__main__":
    print("Testing API Health...")
    test_health()
    
    print("\nTesting CRUD Operations...")
    test_crud()