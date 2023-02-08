resource "aws_s3_bucket" "resource_name"{
  bucket = "newtarce09Bucket"

  tags = {
    Name = "new bucket"
  }
}