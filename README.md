# Terraform-three-tier-project

# Project archtuctre design 
![terraform  2023-12-01 013712](https://github.com/AbdelrhmanAli123/Terraform-three-tier-project/assets/133269614/18fd10d7-ba0e-498b-8325-38511215d94a)

# Project Title

A Three-Tier Infrastructure with Terraform

## Overview

This Terraform project sets up a three-tier infrastructure on a cloud provider. The architecture includes a Virtual Private Cloud (VPC), subnets for different tiers, security groups, instances, and other necessary components.

#
## Features

- **Scalable Infrastructure:** Easily scale your infrastructure based on your needs.
- **Modular Design:** Organized codebase with reusable modules for improved maintainability.
- **Security:** Configures security groups and subnets to enhance the security of your infrastructure.

## Modules 
- Network Module: Manages the VPC, subnets, and networking components.
- Instances Module: Handles the creation of instances in both public and private subnets and creation of load balancer.
- Database Module: Manages and configures the relational database service (RDS) instances.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Terraform installed on your local machine.
- Cloud provider credentials configured.

## Getting Started

Follow these steps to get your project up and running.

### 1. Clone the Repository
```bash
git clone https://github.com/AbdelrhmanAli123/Terraform-three-tier-project.git
cd Terraform-three-tier-project
```
### 2. Initialize and Apply
```bash
terraform init
terraform apply
