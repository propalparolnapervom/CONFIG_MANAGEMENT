# Output variables for this sub-module

output "submodule_region" {
  value = "${var.region}"     # "region" var has been already:
                              #    - defined on the level of this submodule
                              #    - assigned in the body of the root-level module
                              # will be used as `input` for `output` on the root-level module
}