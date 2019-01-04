
#############################################################################
## The file describes remote backend (on S3)
## (state files has to be placed there eventually, instead of local placing)
#############################################################################


# Define backend to store TF state file

terraform {
  backend "s3" {                  # type of the backend
    bucket = "xburser"            # name of the bucket (should be existing)
    key    = "test/terraform/config_1.state"     # specific path in the bucket where state files have to be placed (not necessarly should exist)
    region = "eu-central-1"       # no parameters can be used here:
                                  #   The backend configuration is loaded by Terraform extremely early, before
                                  #   the core of Terraform can be initialized. This is necessary because the backend
                                  #   dictates the behavior of that core. The core is what handles interpolation
                                  #   processing. Because of this, interpolations cannot be used in backend
                                  #   configuration.
  }
}

