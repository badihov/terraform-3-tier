/* resource "aws_s3_bucket" "s3" {
  bucket = "project-s3-terr"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "s3-acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "private"
}
 */
