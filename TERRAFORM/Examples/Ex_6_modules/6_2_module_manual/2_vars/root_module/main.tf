
# List of modules that will be added to the root-level

module "mod_1" {
  source = "../add_module_1"

  region = "eu-central-1"       # Assigning value for the var that defined and used in the module
}




