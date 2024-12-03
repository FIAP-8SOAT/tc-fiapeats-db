terraform {
  backend "s3" {
    bucket         = "terraform-backend-fiapeats" # Substitua pelo nome do bucket
    key            = "state/fiapeatsdb/terraform.tfstate"         # Caminho do estado no bucket
    region         = "us-east-1"                       # Região do bucket
    encrypt        = true                              # Criptografia no bucket
  }
}

provider "aws" {
    region = "us-east-1"  # Substitua pela região desejada
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "default" {
    vpc_id      = "${data.aws_vpc.default.id}"
    name        = "fiapeatsdb-sg"
    description = "Allow all inbound for FiapeatsDB"
    ingress {
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_db_instance" "default" {
    identifier           = "fiapeatsdb"
    allocated_storage    = 5
    db_name              = "fiapeatsdb"
    engine               = "postgres"
    engine_version       = "16.3"
    instance_class       = "db.t3.micro"
    username             = "sa"
    password             = "fiapeats-pass"
    vpc_security_group_ids = [aws_security_group.default.id]
    skip_final_snapshot  = true
    publicly_accessible  = true
}