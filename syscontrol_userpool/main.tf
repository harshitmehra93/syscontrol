provider "aws" {
}
variable "user_pool_name" {
  description = "Admin User Pool Name Syscontrol"
  default="syscontrol-userpool"
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
resource "aws_cognito_user_pool_client" "client1" {
  name = "client"
  allowed_oauth_flows = ["code"]
  callback_urls = ["https://www.google.com"]
  allowed_oauth_scopes = ["openid"]
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
}
resource "aws_cognito_user_pool_client" "client2" {
  name = "client2"
  allowed_oauth_flows = ["client_credentials"]
  generate_secret = true
  user_pool_id = "${aws_cognito_user_pool.pool.id}"
}
