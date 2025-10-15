#!/bin/bash
cd /home/ec2-user/app
echo "Installing Python dependencies..."

# Make sure Python 3 and pip are available
sudo yum install -y python3 python3-pip

# Install project dependencies
pip3 install -r requirements.txt

echo "Dependencies installed successfully."
