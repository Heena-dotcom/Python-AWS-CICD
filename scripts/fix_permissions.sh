#!/bin/bash
# Ensure ec2-user owns the app directory
chown -R ec2-user:ec2-user /home/ec2-user/app
chmod -R +x /home/ec2-user/app/scripts
echo "Permissions fixed successfully."
