# AWS CI/CD Pipeline for Flask Web Application

![AWS](https://img.shields.io/badge/AWS-CodePipeline-orange)
![Flask](https://img.shields.io/badge/Python-Flask-blue)
![CI/CD](https://img.shields.io/badge/CI%2FCD-Automation-green)
![License](https://img.shields.io/badge/license-MIT-lightgrey)

A complete **Continuous Integration and Deployment (CI/CD)** pipeline built on **AWS** that automatically builds, tests, and deploys a **Flask web application** to an **EC2 instance**.

This project demonstrates how to combine AWS native services like **CodeCommit**, **CodeBuild**, **CodeDeploy**, and **CodePipeline** to deliver a seamless deployment workflow.

---

## Architecture Overview

### Services Used
- **GitHub** – Version control for source code  
- **AWS CodeBuild** – Build and test automation  
- **AWS CodeDeploy** – Deployment to EC2 instance  
- **AWS CodePipeline** – CI/CD orchestration  
- **Amazon EC2** – Flask app hosting  
- **IAM** – Role-based access and permissions  
- **S3** – Artifact storage

### Architecture Diagram
![AWS Flask CI/CD Pipeline Diagram](A_flowchart-style_diagram_illustrates_a_Continuous.png)

**Workflow:**
1. Developer pushes code to **CodeCommit** or **GitHub**.
2. **CodePipeline** triggers automatically.
3. **CodeBuild** installs dependencies and packages the app.
4. **S3** stores the build artifact.
5. **CodeDeploy** deploys the new version to EC2.
6. The Flask app runs publicly on `http://<EC2-Public-IP>:5000`.

---

## Project Structure

<pre>aws-flask-cicd/
├── app.py
├── requirements.txt
├── buildspec.yml
├── appspec.yml
└── scripts/
  ├── install_dependencies.sh
  ├── start_server.sh
  └── stop_server.sh</pre>

## Setup Guide

1️⃣ Create IAM Roles

CodeDeployServiceRole – Allows CodeDeploy to access resources like EC2 instances, S3, and CloudWatch.

EC2CodeDeployRole – Attach to EC2 for CodeDeploy access.

> **Important Notes:**
> 
> Assign the CodeDeploy service role when creating a CodeDeploy application/deployment group.
> 
> Assign the EC2 instance role to the EC2 instances being deployed to.</pre>

2️⃣ Launch EC2 Instance

OS: Amazon Linux 2

Security Group: Allow inbound 5000 (TCP)

Attach EC2CodeDeployRole

## Install CodeDeploy agent:

<pre>sudo yum update -y
sudo yum install ruby wget -y
cd /home/ec2-user
wget https://aws-codedeploy-ca-central-1.s3.ca-central-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start </pre>

3️⃣ Create CodeBuild Project

Environment: Amazon Linux 2, Python 3.9

Compute Type: BUILD_GENERAL1_SMALL

Buildspec: use buildspec.yml

4️⃣ Create CodeDeploy Application

Application Name: FlaskApp

Deployment Group: attach CodeDeployServiceRole, attach EC2 instance via Name tag 

5️⃣ Create CodePipeline

Source: CodeCommit or GitHub repository

Build: CodeBuild project

Deploy: CodeDeploy application

After setup, each git push automatically triggers deployment

## Test the Deployment

Once the pipeline succeeds, visit your EC2 public IP:

http://**EC2-public-IP**:5000


You should see:

> Hello from AWS CI/CD Flask Pipeline!

