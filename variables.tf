variable "original_rds_id" {
  description = "The original RDS to have the sandox be based on"
  type        = string
}

variable "optional_sandbox_snapshot_id" {
  description = "Use this when wanting to start based on snapshot of sandbox instead of the original RDS"
  type        = string
  default     = ""
}

variable "sandbox_id_suffix" {
  description = "Suffix on the RDS id"
  type        = string
  default     = "sandbox"
}

variable "save_final_snapshot" {
  description = "Set to true if you would like to save a snapshot of the sandbox when the sandbox RDS is destroyed"
  type        = bool
  default     = false
}
