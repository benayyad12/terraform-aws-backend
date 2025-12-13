
variable "bucket_name" {
  type = string
  description = "s3 bucket for terraform backend"
}

variable "dynamodb_name" {
  type = string
  description = "dynamo db table for state locking"
}

variable "backend_key" {
  type = string
  description = "path to terraform state file"
}

variable "region"{
  type = string
  description = "aws region"
  default = "eu-west-3"
}