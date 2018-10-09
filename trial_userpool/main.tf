provider "aws" {
}
variable "user_pool_name" {
  description = "User Pool Name for the tenant"
  default="trial"
}
variable "tag1" {
  description = "tag1"
  default="tag1"
}
variable "tag2" {
  description = "tag2"
  default="tag2"
}
resource "aws_cognito_user_pool" "pool" {
  name = "${var.user_pool_name}"
  tags = {
    "tag1"="${var.tag1}",
    "tag2"="${var.tag2}"
  }
}

