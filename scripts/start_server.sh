#!/bin/bash
cd /home/ec2-user/app
echo "Starting Flask app..."

# Start Flask app with nohup so it keeps running after SSH closes
nohup python3 app.py > app.log 2>&1 &

echo "Flask app started successfully."
