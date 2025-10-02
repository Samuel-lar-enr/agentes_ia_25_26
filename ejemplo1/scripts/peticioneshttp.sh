#!/bin/bash

BASE_URL="http://localhost:3000/books"
pid=$(tasklist | grep "json-server.exe" | awk '{print $2}')

taskkill /PID $pid /F
npm run lanzar-json-server & sleep 2

echo "=== CREATE (POST) ==="
curl -X POST "$BASE_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 11,
    "title": "Bee Movie",
    "authorId": 11,
    "year": 2007,
    "category": "Animation",
    "price": 14.99,
    "available": true
  }'
echo -e "\n"

#npm run parar-json-server:windows & sleep 2
taskkill /PID $pid /F
npm run lanzar-json-server & sleep 2

echo "=== READ (GET) ==="
curl -X GET "$BASE_URL/11" \
  -H "Content-Type: application/json"
echo -e "\n"

#npm run parar-json-server:windows & sleep 2
taskkill /PID $pid /F
npm run lanzar-json-server & sleep 2
echo "=== UPDATE (PUT) ==="
curl -X PUT "$BASE_URL/11" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 11,
    "title": "Bee Movie",
    "authorId": 11,
    "year": 2007,
    "category": "Animated Comedy",
    "price": 19.99,
    "available": false
  }'
echo -e "\n"

#npm run parar-json-server:windows & sleep 2
taskkill /PID $pid /F
npm run lanzar-json-server & sleep 2
echo "=== UPDATE (PATCH) ==="
curl -X PATCH "$BASE_URL/11" \
  -H "Content-Type: application/json" \
  -d '{
    "price": 9.99,
    "available": true
  }'
echo -e "\n"

#npm run parar-json-server:windows & sleep 2
taskkill /PID $pid /F
npm run lanzar-json-server & sleep 2

echo "=== DELETE ==="
curl -X DELETE "$BASE_URL/11"
echo -e "\n"

taskkill /PID $pid /F
#npm run parar-json-server:windows & sleep 2
