# AWS Cloud Engineering Capstone
End-to-end AWS Cloud Engineering capstone demonstrating Infrastructure as Code with Terraform, automated monitoring using CloudWatch, and CI/CD deployment with GitHub Actions.

## Project Overview

This project demonstrates the design and implementation of a secure, automated, and repeatable cloud infrastructure on Amazon Web Services (AWS). The solution uses Terraform to provision infrastructure as code, Amazon CloudWatch to provide automated monitoring and alerting, and GitHub Actions to implement a continuous integration and continuous deployment (CI/CD) workflow.  The project follows AWS Well-Architected Framework best practices with a primary focus on Security and Operational Excellence while demonstrating modern cloud engineering principles suitable for production environments.

## Business Problem

A small company needs a secure and repeatable cloud environment that can be deployed consistently across development, staging, and production without relying on manual configuration.  Manual deployments increase the risk of configuration drift, security vulnerabilities, and human error.  The business also lacks automated monitoring and alerting, requiring engineers to manually check system health.  An automated system would allow for engineers to respond only when operational issues occur.  Finally, infrastructure changes must be deployed through a controlled and auditable process that validates changes before they reach production, where only approved and tested infrastructure modifications are implemented.

## Objectives

- Design a secure AWS cloud environment using Infrastructure as Code (IaC) with Terraform
- Deploy a repeatable networking architecture that supports development, staging, and production environments.
- Implement security best practices using private networking, IAM roles, and least-privilege access.
- Configure centralized monitoring, logging, dashboards, and automated alerts using Amazon CloudWatch.
- Automate infrastructure validation and deployment using GitHub Actions.
- Implement version control, branch protection, and pull request approvals for infrastructure changes.
- Demonstrate the AWS Well-Architected Framework Security and Operational Excellence pillars.
- Produce comprehensive technical documentation suitable for both a professional portfolio and an academic capstone project.

## Architecture

- Networking
    - Internet Gateway
    - Public Subnet
    - Private Subnet
    - Route Tables
    - Security Groups

- Compute
    - Amazon EC2
    - IAM Role
    - Instance Profile

- Storage
    - Amazon S3

- Monitoring
    - Amazon CloudWatch
    - CloudWatch Logs
    - CloudWatch Dashboard
    - CloudWatch Alarms
    - Amazon SNS

- Administration
    - AWS Systems Manager Session Manager

- Infrastructure
    - Terraform

- Source Control CI/CD
    - GitHub
    - GitHub Actions

## AWS Services

## Repository Structure

## Project Phases

## Technologies Used

## Well-Architected Framework

## Deployment

## Screenshots

## Lessons Learned

## Future Improvements
