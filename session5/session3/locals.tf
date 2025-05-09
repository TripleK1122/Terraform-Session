// Naming Convention: Naming Standard 

// 1. Provider NName : aws,azure ,gcp, do, alibaba 
// 2, Region: usw1,usw2,use1,use2
// 3. Resourse Type: ec2,s3, sqs,asg,alb,efs
// 4. Environment: dev, qa, stg, prod
// 5. Business Unit: orders, payments, streaming
// 6. Project Name: unicorn, batman, tom , jerry, ihop, ipa
// 7. Tier: frontend, backend, db


// Example1: aws-usw2-vpc-dev-orders-tom-db
// aws-usw2-vpc-orders-tom-db-dev
// aws-usw2-vpc-orders-tom-db-qa
// aws-usw2-vpc-orders-tom-db-stg

// Example2: orders-tom-db-aws-usw2-vpc-dev

// Example3: tom-aws-usw2-vpc-orders-db-dev

// Tagging Convention: Tagging Standard: Common tags

// 1. Environment: dev, qa, stg, prod
// 2. Project Name: unicorn, batman, tom, jerry 
// 3. Business Unit: orders, payments, streaming
// 4. Team: DevOps, DRE, SRE, Security
// 5. Owner: kostyaone0@gmail.com
// 6. Managed_By: cloudformation, terraform, python, manual
// 7. Market: na, asia , eu

locals {
    // Naming Standard 
    name = "${var.provider_name}-${var.region}-rtype-${var.business_unit}-${var.project}-${var.tier}-${var.env}"
    // Tagging Standard
    command_tags = {
        Environment = var.env
        Project_Name = var.project
        Business_unit = var.business_unit
        Team = var.team
        Owner = var.owner
        Managed_By = var.managed_by
        Market = "us"
    }
}