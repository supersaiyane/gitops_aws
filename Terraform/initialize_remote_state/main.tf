# add s3 and dynamo db depencecy here


################################
# S3
################################

resource "aws_s3_bucket" "rugged_buckets" {
  count         = length(var.s3_bucket_names)
  bucket        = var.s3_bucket_names[count.index]
  #acl = "private"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "s3acl" {
  count = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.rugged_buckets[count.index].id
  #bucket = flatten([aws_s3_bucket.rugged_buckets.*.id])
  acl = "private"
}

resource "aws_s3_bucket_ownership_controls" "s3Ownership" {
  count = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.rugged_buckets[count.index].id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_versioning" "s3Versioning" {
  count = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.rugged_buckets[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "s3PublicBlock" {
  count = length(var.s3_bucket_names)
  bucket = aws_s3_bucket.rugged_buckets[count.index].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


################################
# dynamodb
################################

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5
 
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Project     = "pfv3stage"
    Owner       = "Vertisystem PVT. LTD"
    Description = "Dynamodb for pfv3stage terraform state"
  }
}


resource "aws_dynamodb_table" "stage-ekscluster" {
  name = "stage-ekscluster"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5
 
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Project     = "pfv3stage"
    Owner       = "Vertisystem PVT. LTD"
    Description = "Dynamodb for pfv3stage terraform state"
  }
}

resource "aws_dynamodb_table" "stage-eks-cloudwatch-lb" {
  name = "stage-eks-cloudwatch-lb"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5
 
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Project     = "pfv3stage"
    Owner       = "Vertisystem PVT. LTD"
    Description = "Dynamodb for pfv3stage terraform state"
  }
}