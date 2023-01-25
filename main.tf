module "kinesis_stream_and_firehose" {
  source = "./modules/kinesis_stream_and_firehose"
  stream_name = "my-stream"
  firehose_name = "my-firehose"
}
