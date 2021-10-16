Collection of different terraform modules using aws as a cloud provider

The source code of all modules can be used as a module in your project

Example configuration for using the lambda source code:

module "lambda" {
source = "git@github.com:casasky/terraform_modules.git//lambda"
}