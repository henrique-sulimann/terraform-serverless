variable "region" {
  default = "us-east-1"
}
variable "env" {
  default = "dev"
}
variable "account_id" {
  default = "1234567899"
}
variable "cg_pool" {
  default = "Todos"
}

variable "cg_client" {
  default = "todos-app-client"
}
variable "cg_domain" {
  default = "todos-api"
}

variable "dbname" {
  default = "todos"
}

variable "read_capacity" {
  default = 5
}

variable "write_capacity" {
  default = 5
}

variable "api_name" {
  default = "todos terraform"
}

variable "api_description" {
  default = "API built with terraform"
}
variable "sns_topic_name" {
  default = "s3-data-drop"
}
