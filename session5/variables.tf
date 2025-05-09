// Naming Convention: Naming Standard 

// 1. Provider Name : aws,azure ,gcp, do, alibaba - done
// 2, Region: usw1,usw2,use1,use2 - done
// 3. Resourse Type: ec2,s3, sqs,asg,alb,efs -done
// 4. Environment: dev, qa, stg, prod -done
// 5. Business Unit: orders, payments, streaming -done
// 6. Project Name: unicorn, batman, tom , jerry, ihop, ipa -done
// 7. Tier: frontend, backend, db -done


// Example1: aws-usw2-vpc-dev-orders-tom-db
// aws-usw2-vpc-orders-tom-db-dev
// aws-usw2-vpc-orders-tom-db-qa
// aws-usw2-vpc-orders-tom-db-stg

// Example2: orders-tom-db-aws-usw2-vpc-dev

// Example3: tom-aws-usw2-vpc-orders-db-dev

// Tagging Convention: Tagging Standard: Common tags

// 1. Environment: dev, qa, stg, prod -done
// 2. Project Name: unicorn, batman, tom, jerry -done
// 3. Business Unit: orders, payments, streaming - done
// 4. Team: DevOps, DRE, SRE, Security -done
// 5. Owner: kostyaone0@gmail.com -done
// 6. Managed_By: cloudformation, terraform, python, manual - done

variable "env" {
    description = "Environmnet"
    type = string
    default = "dev"
}
variable "provider_name" {
    description = "Provider"
    type = string
    default = "aws"
  
}
variable "business_unit" {
    description = "Busines Unit"
    type = string
    default = "orders"
  
}
variable "region" {
    description = "Provider Region Name"
    type = string
    default = "us-east-2"
  
}
variable "project" {
    description = "Project name"
    type = string
    default = "tom"
  
}
variable "tier" {
    description = "Application tier"
    type = string
    default = "db"
  
}
variable "team" {
    description = "Team name"
    type = string
    default = "DevOps"
  
}
variable "owner" {
    description = "Resours owner"
    type = string
    default = "Kostya"
  
}
variable "managed_by" {
    description = "Tool"
    type = string
    default = "terraform"
  
}