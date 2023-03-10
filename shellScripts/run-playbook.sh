#!/bin/bash

# Get all EC2 instance hostnames
echo "[all]" >playbook/inventory
aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --output text --region us-east-1 >>playbook/inventory

# Run ansible with the created inventory file
ansible-playbook -i playbook/inventory playbook/main.yml
