locals {

  bucket_name = join("-", [
    "s3",
    lower(var.project_name),
    lower(var.environment),
    "001"
  ])

}