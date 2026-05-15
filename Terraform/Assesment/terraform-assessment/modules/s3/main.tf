resource "aws_s3_bucket" "this" {

  count = var.bucket_count

  bucket = "${local.bucket_name}-${count.index + 1}"

  tags = merge(
    var.common_tags,
    {
      Name         = "${local.bucket_name}-${count.index + 1}"
      ResourceType = upper("s3")
    }
  )

  lifecycle {
    prevent_destroy = true
  }

}