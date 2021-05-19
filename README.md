# Terraform AWS DB Sandbox Clone
Create an RDS clone based on an existing RDS instance

## Use
1. `terraform init`
1. `terraform apply`
1. Enter the id of the RDS instance to clone

## Optional variables
May optionally save the final snapshot of the sandbox instance when destroying the sandbox RDS instance.
This allows for saving work done on the sandbox RDS instance.

May optionally provide a snapshot id. This allows for continuing work on a previously destroyed sandbox.

## Assumptions
It is assumed that the original RDS instance only has one parameter group and one option group. This 
configuration only copies the first parameter and first option group onto the sandbox RDS.