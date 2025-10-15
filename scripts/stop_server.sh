#!/bin/bash
echo "Stopping existing Flask app..."
pkill -f "python3 app.py" || true
echo "Flask app stopped."
