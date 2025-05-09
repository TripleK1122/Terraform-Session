resource "aws_sqs_queue" "main" {
    name = replace(local.name, "rtype","sqs" )
    tags =  merge(
         local.command_tags,
        { Name = replace(local.name, "rtype","sqs" )}
    )
}

# resource "aws_sqs_queue" "main" {
    # name = "${var.provider_name}-${var.region}-sqs-${var.business_unit}-${var.project}-${var.tier}-${var.env}"
#     tags = {
#         Name = "${var.provider_name}-${var.region}-sqs-${var.business_unit}-${var.project}-${var.tier}-${var.env}"
#         Environment = var.env
#         Project_Name = var.project
#         Business_unit = var.business_unit
#         Team = var.team
#         Owner = var.owner
#         Managed_By = var.managed_by
#     }
# }
# resource "aws_security_group" "main" {
#     name = "${var.provider_name}-${var.region}-sqs-${var.business_unit}-${var.project}-${var.tier}-${var.env}"
#     description = "Allow SSH and HTTP access"
#     tags = {
#         Environment = var.env
#         Project_Name = var.project
#         Business_unit = var.business_unit
#         Team = var.team
#         Owner = var.owner
#         Managed_By = var.managed_by
#     }
# }
resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype","sqs" ) // RDS INSTANCE NAME 
  db_name              = "wordpress" // database name such as wordpress
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.main_db_password.result
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = var.env != "prod" ? true : false // true  
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}- final-snapshot"
}
resource "random_password" "main_db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}


output "main_db_password" {
    value = random_password.main_db_password.result
    sensitive = true
}
 // skip_final_snapshot  = true
 // there is no snapshot
 // skip_final_snapshot = fals
 // there will be a snapshot 

 // Problem Statement I want a shapshot only in Prod environment but not in Dev, QA, Stage

 // Conditional Expression: if it's prod, false. If it's not prod,true
 // skip_final_snapshot: true, final_snapshot_identifier = null
 // skip_final_snapshot: folse, final_snapshot_identifier = " final snapshot"

 