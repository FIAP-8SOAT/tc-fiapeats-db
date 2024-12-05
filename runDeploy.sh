#!/bin/bash

set -e
set -x

S3_BUCKET="terraform-backend-fiapeats"
TF_KEY="state/fiapeatsdb/terraform.tfstate"
REGION="us-east-1"
DB_INSTANCE_IDENTIFIER="fiapeatsdb"

terraform init
terraform plan
terraform apply -auto-approve

echo "Validando a criação do banco de dados..."

DB_STATUS=$(aws --profile fiapeats rds describe-db-instances \
  --db-instance-identifier $DB_INSTANCE_IDENTIFIER \
  --query "DBInstances[0].DBInstanceStatus" \
  --region $REGION \
  --output text)

if [ "$DB_STATUS" == "available" ]; then
  echo "Banco de dados $DB_INSTANCE_IDENTIFIER criado com sucesso e está disponível!"
else
  echo "Erro: Banco de dados $DB_INSTANCE_IDENTIFIER não está disponível. Status atual: $DB_STATUS"
  exit 1
fi

DB_ENDPOINT=$(aws --profile fiapeats rds describe-db-instances \
  --db-instance-identifier $DB_INSTANCE_IDENTIFIER \
  --query "DBInstances[0].Endpoint.Address" \
  --region $REGION \
  --output text)

DB_PORT=$(aws --profile fiapeats rds describe-db-instances \
  --db-instance-identifier $DB_INSTANCE_IDENTIFIER \
  --query "DBInstances[0].Endpoint.Port" \
  --region $REGION \
  --output text)

echo "Detalhes do banco de dados:"
echo "Endpoint: $DB_ENDPOINT"
echo "Porta: $DB_PORT"

echo "Script concluído com sucesso!"
