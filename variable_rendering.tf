resource "aws_s3_bucket" "default" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }
  tags = {
    yor_trace = "b9c89f56-b1ba-4e8b-81ae-4f7576b2a51d"
  }
}