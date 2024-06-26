#!/bin/bash

# Change to the script directory
cd "$(dirname "$0")"

# Create a temporary virtual environment
echo "Creating virtual environment..."
python3.10 -m venv temp_env

# Activate the virtual environment
source temp_env/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r ../requirements.txt

# Run destroy.sh to reset the database
echo "Running destroy.sh..."
./destroy.sh

# Run create_db.py to set up the database
echo "Running create_db.py..."
python3 create_db.py

# Run team_scrape.py to scrape team data
echo "Running team_scrape.py..."
python3 team_scrape.py

# Run advanced_scrape.py to scrape advanced data
echo "Running advanced_scrape.py..."
python3 advanced_scrape.py

# Deactivate and remove the virtual environment
deactivate
echo "Cleaning up virtual environment..."
rm -rf temp_env

echo "Full reset complete."
