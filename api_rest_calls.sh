#!/bin/bash

# Define the base URL of the API
BASE_URL="https://api.example.com"

# Define API key or authentication token (if required)
API_KEY="your_api_key_here"

# Function to perform a GET request
function get_request() {
    ENDPOINT="/resource"
    echo "Performing GET request to $BASE_URL$ENDPOINT"
    curl -X GET "$BASE_URL$ENDPOINT" \
         -H "Authorization: Bearer $API_KEY" \
         -H "Content-Type: application/json"
}

# Function to perform a POST request
function post_request() {
    ENDPOINT="/resource"
    DATA='{
        "name": "Sample Name",
        "description": "This is a sample description"
    }'
    echo "Performing POST request to $BASE_URL$ENDPOINT"
    curl -X POST "$BASE_URL$ENDPOINT" \
         -H "Authorization: Bearer $API_KEY" \
         -H "Content-Type: application/json" \
         -d "$DATA"
}

# Function to perform a PUT request
function put_request() {
    ENDPOINT="/resource/123"
    DATA='{
        "name": "Updated Name",
        "description": "This is an updated description"
    }'
    echo "Performing PUT request to $BASE_URL$ENDPOINT"
    curl -X PUT "$BASE_URL$ENDPOINT" \
         -H "Authorization: Bearer $API_KEY" \
         -H "Content-Type: application/json" \
         -d "$DATA"
}

# Function to perform a DELETE request
function delete_request() {
    ENDPOINT="/resource/123"
    echo "Performing DELETE request to $BASE_URL$ENDPOINT"
    curl -X DELETE "$BASE_URL$ENDPOINT" \
         -H "Authorization: Bearer $API_KEY" \
         -H "Content-Type: application/json"
}

# Main menu to select API operations
echo "Choose an API operation:"
echo "1. GET Request"
echo "2. POST Request"
echo "3. PUT Request"
echo "4. DELETE Request"
read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        get_request
        ;;
    2)
        post_request
        ;;
    3)
        put_request
        ;;
    4)
        delete_request
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac