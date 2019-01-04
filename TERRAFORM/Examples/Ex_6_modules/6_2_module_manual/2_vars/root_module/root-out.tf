# Output variables for root-level module

output "used_region" {
  value = "${module.mod_1.submodule_region}"    # "region" has to be already defined in the submodule as `output`
}