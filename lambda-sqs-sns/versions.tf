terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.63"
      configuration_aliases = [aws.localstack, aws.cloud]
    }
  }

  required_version = "~> 1.0"
}