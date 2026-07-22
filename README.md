# AWS Cloud Engineering Portfolio Project
Secure, automated, and reproducible AWS infrastructure built with Terraform, GitHub Actions, and AWS CloudWatch following the AWS Well-Architected Framework.

---

## Project Overview

This project demonstrates the design and implementation of a secure, automated, modular, and reproducible cloud infrastructure on Amazon Web Services (AWS) using infrastructure as Code (IaC) with Terraform. The solution addresses common cloud engineering challenge by automating infrastructure deployment, implementing operational monitoring, and validating infrastructure changes through a GitHub Actions CI/CD workflow.  

The architecture provisions AWS networking, compute, monitoring, and storage resources while emphasizing automation, security, maintainability, and repeatability.  Throughout development, design decisions were guided by the AWS Well-Architected Framework and adapted where needed to accommodate AWS Academy sandbox limitations without compromising architectural best practices.  

This repository contains the complete Terraform source code, technical documentation, architecture diagrams, screenshots, and implementation details for the project.

---

# Solution Architecture

<p align="center">
  <img src="diagrams/aws-cloud-architecture-diagram.png" width="900">
</p>

The infrastructure is organized into reusable Terraform modules:

- **Networking** - Amazon VPC, Internet Gateway, public/private subnets, route tables
- **Compute** - Amazon EC2 with least-privilege security groups
- **Monitoring** - Amazon CloudWatch Logs, Amazon CloudWatch Alarms, and Amazon Simple Notification Service (SNS)
- **Storage** - Amazon S3 with server-side encryption
- **Automation** - GitHub Actions for Terraform validation and CI/CD

## Business Problem

Small organizations often face challenges when adopting cloud infrastructure, including inconsistent manual deployments, limited operational visibility, and difficulty maintaining secure and repeatable environments.

This project addresses these challenges by designing an automated AWS environment that provides:

- Consistent infrastructure deployment through Infrastructure as Code (IaC)
- Improved security posture through network segmentation and least-privilege design
- Operational visibility through automated monitoring and alerting
- Controlled infrastructure changes through version control and automated validation

The solution was designed around two primary AWS Well_architected Framework pillars:

- **Security** - protecting resources through controlled access, network isolation, and secure configuration practices
- **Operational Excellence** - enabling reliable operations through automation, monitoring, and repeatable processes

---

## Project Objectives

The goal of this project was to create a production-style AWS environment that  demonstrates practical cloud engineering skills.

The primary objectes were:

| Objective | Implementation |
|-----------|----------------|
| Automate infrastructure deployment | Terraform modules for AWS resource  provisioning |
| Create a secure network foundation | Amazon VPC with public/private subnet separation |
| Deploy cloud compute resources | Amazon EC2 infrastructure managed through Terraform |
| Implement monitoring and alerting | Amazon CloudWatch metrics, logs, alarms, and SNS notifications |
| Secure cloud storage | Amazon S3 bucket with server-side encryption |
| Validate infrastructure architecture | GitHub Actions Terraform validation workflow |
| Maintain reusable architecture | Modular Terraform structure supporting multiple environments |

## Technology Stack

This project uses a combination of cloud services, Infrastructure as Code tooling, automation workflows, and documentation tools to create a secure and repeatable AWS environment.

| Category | Technology | Purpose |
|-----------|------------|---------|
| Cloud Provider | Amazon Web Services (AWS) | Cloud infrastructure platform |
| Infrastructure as Code | Terraform | Automated provisioning and lifecycle management of AWS resources |
| Compute | Amazon EC2 | Cloud-based compute resources |
| Networking | Amazon VPC | Secure network isolation and traffic management |
| Storage | Amazon S3 | Scalable object storage with server-side encryption |
| Monitoring | Amazon CloudWatch | Metrics, logs, dashboards, and operational monitoring |
| Alerting | Amazon SNS | Automated notifications for infrastructure events |
| Source Control | GitHub | Version control and project collaboration |
| CI/CD Automation | GitHub Actions | Terraform validation and automated workflow execution |
| Architecture Design | Draw.io | Network topology and architecture diagrams |
| Development Environment | Visual Studio Code / GitHub Codespaces | Terraform development and testing environment |

---

## AWS Services Implemented

The final architecture includes the following AWS components:

### Networking
- Amazon VPC
- Internet Gateway
- Public and private subnets
- Public and private route tables
- Security groups

### Compute
- Amazon EC2 instance
- Security group configuration following least-privilege principles

### Storage
- Amazon S3 bucket
- Server-side encryption using AES-256

### Monitoring and Operations
- Amazon CloudWatch Log Group
- CloudWatch CPU utilization alarm
- CloudWatch EC2 status check alarm
- Amazon SNS notification topic

### Automation
- Terraform modules for infrastructure provisioning
- GitHub Actions workflow for Terraform validation

