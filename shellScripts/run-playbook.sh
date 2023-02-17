#!/bin/bash

# Get all EC2 instance hostnames
echo "[all]" >../playbook/inventory
aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --output text --region us-west-2 >> inventory

# Run ansible with the created inventory file
ansible-playbook -i inventory main.yml
