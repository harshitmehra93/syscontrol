provider "aws" {
  region="us-east-1"
}

resource "aws_dynamodb_table" "users" {
  name           = "users"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags {
    Name        = "users"
    Environment = "production"
  }
}
