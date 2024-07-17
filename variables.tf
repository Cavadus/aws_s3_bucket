variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "acl" {
  description = "The ACL to apply to the S3 bucket."
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning on the bucket."
  type        = bool
  default     = false
}

variable "lifecycle_enabled" {
  description = "Enable lifecycle rules on the bucket."
  type        = bool
  default     = false
}

variable "lifecycle_id" {
  description = "ID for the lifecycle rule."
  type        = string
  default     = "lifecycle-rule"
}

variable "lifecycle_transition_days" {
  description = "Days after which to transition objects."
  type        = number
  default     = 30
}

variable "lifecycle_transition_storage_class" {
  description = "Storage class to transition objects to."
  type        = string
  default     = "GLACIER"
}

variable "lifecycle_expiration_days" {
  description = "Days after which to expire objects."
  type        = number
  default     = 365
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use."
  type        = string
  default     = "AES256"
}

variable "read_access_principals" {
  description = "List of principals to grant read access."
  type        = list(string)
  default     = []
}

variable "write_access_principals" {
  description = "List of principals to grant write access."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to the bucket."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The environment for the bucket (e.g., dev, prod)."
  type        = string
  default     = "dev"
}
