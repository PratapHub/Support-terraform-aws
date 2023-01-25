resource "aws_kinesis_stream" "example" {
  name = var.stream_name
  shard_count = 1
}

resource "aws_kinesis_firehose_delivery_stream" "example" {
  name = var.firehose_name
  destination = "s3"
  s3_configuration {
    bucket_arn = aws_s3_bucket.example.arn
    prefix = "kinesis-data"
  }
}
resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name
}

resource "aws_iam_role" "example" {
  name = "kinesis_firehose_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "example" {
  name = "kinesis_firehose_policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.example.arn}",
        "${aws_s3_bucket.example.arn}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example" {
  role = aws_iam_role.example.name
  policy_arn = aws_iam_policy.example.arn
}
