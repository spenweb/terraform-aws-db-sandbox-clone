# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "us-west-2"
}

data "aws_db_instance" "original" {
  db_instance_identifier = var.original_rds_id
}

data "aws_db_snapshot" "latest_original_snapshot" {
  db_instance_identifier = data.aws_db_instance.original.id
  most_recent            = true
}

locals {
  original                  = data.aws_db_instance.original
  sandbox_id                = "${local.original.id}-${var.sandbox_id_suffix}"
  final_snapshot_identifier = var.save_final_snapshot ? "${local.sandbox_id}-final-snapshot" : "n/a"
}

# Use snapshot from original as well as origianl's RDS config to create a sandbox RDS instance
resource "aws_db_instance" "sandbox" {
  snapshot_identifier = var.optional_sandbox_snapshot_id != "" ? var.optional_sandbox_snapshot_id : data.aws_db_snapshot.latest_original_snapshot.id

  max_allocated_storage     = local.original.allocated_storage + 500
  instance_class            = local.original.db_instance_class
  identifier                = local.sandbox_id
  engine_version            = local.original.engine_version
  option_group_name         = element(local.original.option_group_memberships, 0)
  parameter_group_name      = element(local.original.db_parameter_groups, 0)
  vpc_security_group_ids    = local.original.vpc_security_groups
  storage_type              = local.original.storage_type
  final_snapshot_identifier = local.final_snapshot_identifier
  skip_final_snapshot       = ! var.save_final_snapshot
  apply_immediately         = true
  publicly_accessible       = false

  lifecycle {
    ignore_changes = [snapshot_identifier]
  }
}
