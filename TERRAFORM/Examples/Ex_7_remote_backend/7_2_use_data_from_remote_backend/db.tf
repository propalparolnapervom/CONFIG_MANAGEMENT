#############################################################################
## The file describes DynamoDB table, where data for remote backend on S3
## has to be placed to enable locking functionality
#############################################################################

# This DB or table is not necessarly has to be existing:
# Terraform will create it during `apply` step
resource "aws_dynamodb_table" "tf_dynamodb_resource" {    # random resource name
  name           = "tf_dynamodb_table"                    # random DB table name, needs to be unique within a region
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"                             # The attribute to use as the hash (partition) key. 
                                                        # Must also be defined as an attribute, see below.

  attribute {                           # List of nested attribute definitions. 
                                        # Only required for `hash_key` and `range_key` attributes
    name = "LockID"
    type = "S"
  }
}