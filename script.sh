#!/bin/bash

# 1. Set the API endpoint URL
API_URL="https://swapi.dev/api/people/"

# 2. Make the API request using curl
RESPONSE=$(curl -s $API_URL)

# 3. Check for errors
if [ $? -ne 0 ]; then
  echo "Error: API request failed."
  exit 1
fi

# 4. Parse the JSON response using jq to extract the first 10 names
NAMES=$(echo $RESPONSE | jq -r '.results | .[0:9] | .[].name')

# 5. Print the extracted names
echo "Names from SWAPI:"
for name in $NAMES; do
  echo $name
done
