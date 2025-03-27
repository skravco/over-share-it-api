#!/bin/bash

API_URL="http://localhost:5000/users"

echo "Running smoke test..."

# 1️⃣ Check if the API is running
echo "Checking if API is running..."
if curl -s --head --request GET $API_URL | grep "200 OK" > /dev/null; then
    echo "API is running."
else
    echo "API is NOT running! Start Flask server first."
    exit 1
fi

# 2️⃣ Create a test user
echo "Creating a test user..."
RESPONSE=$(curl -s -X POST $API_URL -H "Content-Type: application/json" -d '{
    "name": "John",
    "family_name": "Doe",
    "company": "OpenAI",
    "email": "john.doe@example.com",
    "phone": "1234567890"
}')

echo "API Response: $RESPONSE"

# 3️⃣ Fetch all users and extract the test user ID
echo "Fetching all users..."
USER_LIST=$(curl -s $API_URL | jq '.')

echo "Users List:"
echo "$USER_LIST" | jq '.'

USER_ID=$(echo "$USER_LIST" | jq -r '.[] | select(.email=="john.doe@example.com") | .id')

if [ -z "$USER_ID" ]; then
    echo "Test user not found!"
    exit 1
else
    echo "Test user found with ID: $USER_ID"
fi

# 4️⃣ Fetch the user by ID
echo "Fetching user by ID: $USER_ID"
USER_DATA=$(curl -s "$API_URL/$USER_ID" | jq '.')

echo "User Details:"
echo "$USER_DATA"

# 5️⃣ Delete the test user
echo "Deleting test user..."
DELETE_RESPONSE=$(curl -s -X DELETE "$API_URL/$USER_ID")

echo "API Response: $DELETE_RESPONSE"

# 6️⃣ Verify user deletion
echo "Verifying user deletion..."
NEW_USER_LIST=$(curl -s $API_URL | jq '.')

if echo "$NEW_USER_LIST" | jq -e ".[] | select(.id==$USER_ID)" > /dev/null; then
    echo "User deletion failed!"
    exit 1
else
    echo "User successfully deleted!"
fi

echo "Smoke test PASSED!"
exit 0

