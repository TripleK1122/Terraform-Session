#!/bin/bash 

rm -rf .terraform*
read -p "Which evironment you wanna choose?" ENV
$echo ENV
sed -i "s/_env_/$ENV/g" backend.tf 

echo "Environment is set to $ENV

terraform init
terraform apply -var- file = $ENV.tfvars

echp "Rolling back to static string"
sed - i "s/$ENV/_env_/g" backend.tf

echo "Infra was deployed succesfully to $ENV environment"
