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

A small company needs a secure and repeatable cloud environment that can be deployed consistently across development, staging, and production without relying on manual configuration.  Manual deployments increase the risk of configuration drift, security vulnerabilities, and human error.  The business also lacks automated monitoring and alerting, requiring engineers to manually check system health.  An automated system would allow for engineers to respond only when operational issues occur.  Finally, infrastructure changes must be deployed through a controlled and auditable process that validates changes before they reach production, where only approved and tested infrastructure modifications are implemented.

