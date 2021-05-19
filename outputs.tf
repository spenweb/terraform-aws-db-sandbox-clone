output "sandbox_address" {
  description = "Address of the sandbox RDS instance"
  value       = aws_db_instance.sandbox.address
}

output "sandbox_port" {
  description = "Port of the sandbox RDS instance"
  value       = aws_db_instance.sandbox.port
}

output "sandbox_final_snapshot_identifier" {
  description = "ID of final snapshot for the sandbox when it is destroyed"
  value       = local.final_snapshot_identifier
}
