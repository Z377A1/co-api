#!/bin/bash

echo "Building all services..."
docker-compose down
docker-compose build

echo "Starting services..."
docker-compose up -d

echo "Waiting for services to start..."
sleep 10

echo "Testing all APIs..."
echo "1. Testing Rust API (Owners):"
curl -f http://localhost/api/owners/health

echo -e "\n2. Testing Go API (Franchises):"
curl -f http://localhost/api/franchises/health

echo -e "\n3. Testing Bun API (Movies):"
curl -f http://localhost/api/movies/health

echo -e "\n4. Testing Java API (Box Office):"
curl -f http://localhost/api/boxoffice/health

echo -e "\n5. Testing C# API (Cast Members):"
curl -f http://localhost/api/cast-members/health

echo -e "\n6. Testing Kotlin API (Images):"
curl -f http://localhost/api/images/health

echo -e "\nAll APIs are running!"
echo "Access Gateway at: http://localhost"