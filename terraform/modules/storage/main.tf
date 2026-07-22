# Amazon S3 provides durable, highly available object storage.
# This bucket can store application assets, backups, logs,
# or other project data while following AWS security best practices.
resource "aws_s3_bucket" "storage" {
    bucket = "${var.environment}-${var.project_name}-${random_string.bucket_suffix.result}"

    tags = {
        Name        = "${var.environment}-storage"
        Environment = var.environment
    }
}

# Generate a unique suffix becasue S3 bucket names are globally unique.
resource "random_string" "bucket_suffix" {
    length  = 6
    special = false
    upper   = false
}

# Enable object versioning to protect against accidental deletion
# and provide simple recovery of previous object versions.
resource "aws_s3_bucket_versioning" "storage" {
    bucket = aws_s3_bucket.storage.id

    versioning_configuration {
        status = "Enabled"
    }
}

# Enable default server-side encryption using Amazon S3 managed keys.
# AES256 was choosen for for this small project due to simple configuration,
# no IAM key permissions,and no additional resources.  
resource "aws_s3_bucket_server_side_encryption_configuration" "storage" {
    bucket = aws_s3_bucket.storage.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}