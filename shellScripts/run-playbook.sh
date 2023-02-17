#!/bin/bash

# Get all EC2 instance hostnames
hostnames=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicDnsName' --output text)

# Create inventory file with the hostnames
echo "[ec2_hosts]" >../playbook/inventory

# Run ansible with the created inventory file
ansible-playbook -i inventory main.yml
