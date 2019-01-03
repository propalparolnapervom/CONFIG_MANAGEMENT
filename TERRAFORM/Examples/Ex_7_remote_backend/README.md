

We've now seen how to build, change, and destroy infrastructure from a local machine.

This is great for testing and development, but in production environments it is more responsible to share responsibility for infrastructure. 

The best way to do this is by running Terraform in a remote environment with shared access to state.

Terraform supports team-based workflows with a feature known as [remote backends](https://www.terraform.io/docs/backends/index.html): it allows Terraform to use a shared storage space for state data, so any member of your team can use Terraform to manage the same infrastructure.

_____

[Backends](https://www.terraform.io/docs/backends/index.html)

[Backend Types](https://www.terraform.io/docs/backends/types/)

A **backend** in Terraform determines where state is stored (how state is loaded) and how an operation such as `apply` is executed.

This abstraction enables:

    - non-local file state storage
    - remote execution
    - etc

Backends are responsible for:

    - storing state
    - providing an API for state locking (optional)

By default, Terraform uses the "local" backend, which is the normal behavior of Terraform you're used to.

_____

[Remote State](https://www.terraform.io/docs/providers/terraform/d/remote_state.html)

**Remote State** retrieves state data from a Terraform backend.

This allows you to use the root-level outputs of one or more Terraform configurations as input data for another configuration.
