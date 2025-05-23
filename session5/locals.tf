// ONE:
// Naming Convention: Naming Standard
// 1. Provider Name: aws, azure, gcp, do, alibaba
// 2. Region: usw1, usw2, use1
// 3. Resource Type: ec2, s3, sqs, asg, alb, efs
// 4. Environment: dev, qa, stg, prod
// 5. Business Unit: orders, payments, streaming
// 6. Project Name: unicorn, batman, tom, jerry, ihop, ipa
// 7. Tier: frontend, backend, db

// Example: aws-usw2-vpc-dev-orders-tom-db

// So, we should put env at the end
// aws-usw2-vpc-orders-tom-db-qa


// TWO:
// Tagging Standard: Common tags
// 1. Environment: dev, qa, stg, prod
// 2. Project Name: unicorn, batman, tom, jerry, ihop, ipa
// 3. Business Unit: orders, payments, streaming
// 4. Team: DevOps, DRE, SRE, Security
// 5. Owner: kris@akumosolutions.io
// 6. Managed_By: cloudformation, terraform, python, manual
// 7. Lead: akmal@akumosolutions.io

locals {
  name = "${var.provider_name}-${var.region}-rtype-${var.business_unit}-${var.tier}-${var.project}-${var.env}"
  
  common_tags = {
    Environment = var.env
    Project_name = var.project
    Business_unit = var.business_unit
    Team = var.team
    Owner = var.owner
    Managed_by = var.managed_by
    Market = "us"
  }
}