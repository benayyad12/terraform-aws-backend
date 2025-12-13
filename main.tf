module "s3" {
  source      = "./modules/s3"
}

module "dynamodb" {
  source        = "./modules/dynamodb"
  dynamodb_name = "dynamodb-state"
  pay_mode      = "PAY_PER_REQUEST"
  hkey          = "LockID"
}