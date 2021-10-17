# Collection of different terraform modules using aws as a cloud provider

All modules are maintained by @CasaSky.

You can integrate the managed terraform modules in your project by adding the source entry of the module you wish to use.

Example configuration for using the lambda-sqs-sns source code:

```terraform
module "lambda" {
  source = "git@github.com:casasky/terraform-modules.git//lambda-sqs-sns"
}

You can check the demo [GitHub](https://github.com/CasaSky/lambda-demo-module-in-java) repository to see in detail how you can integrate a specific module.
