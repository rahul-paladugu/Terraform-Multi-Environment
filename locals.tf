locals {
  common_name = "${var.project}-${var.environment}"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = true
  }
  ec2_tags = merge(local.common_tags, { Name = "${local.common_name}-jump-host" })
  sg_tags = merge(local.common_tags, { Name = "${var.environment}-${var.project}-SG" })
  r53_name = "${var.environment}-${var.project}"
}