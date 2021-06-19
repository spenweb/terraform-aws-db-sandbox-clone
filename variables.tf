variable "original_rds_id" {
  description = "The original RDS to have the sandox be based on"
  type        = string
}

variable "optional_sandbox_snapshot_id" {
  description = "Use this when wanting to start based on snapshot of sandbox instead of the original RDS"
  type        = string
  default     = ""
}

variable "save_final_snapshot" {
  description = "Set to true if you would like to save a snapshot of the sandbox when the sandbox RDS is destroyed"
  type        = bool
  default     = false
}

variable "sandbox_id_suffix" {
  description = "Suffix on the RDS id"
  type        = string
  default     = "sandbox"
}

variable "buffer_storage_gb" {
  description = "Number of GBs to be summed with original RDS instance's allocated_storage which total will be the max_allocated_storage"
  type        = number
  default     = 0
}

variable "extra_vpc_security_group_ids" {
  description = "List of VPC security group ids that will be added to the created RDS instance"
  type        = list
  default     = []
}
