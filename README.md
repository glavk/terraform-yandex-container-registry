# Terraform module

Terraform module which creates [resource](https://cloud.resource) on [Yandex.Cloud](https://cloud.yandex.ru/).

## Examples

Simple registry with two repositories (test1 and test2).

```terraform
locals {
  policy = {
    expire_period = "48h"
  }
  sa_id = "xxx" //service account id
}

module "cr" {
  source  = "glavk/container-registry/yandex"
  version = "0.1.0"

  registry = "test"

  role    = "puller"
  members = ["system:allUsers"]

  repos = {
    test1 = {
      role    = "pusher"
      members = [
        "serviceAccount:${local.sa_id}"
      ]
      lifecycle_policy = local.policy
    },
    test2 = {
      role    = "pusher"
      members = [
        "serviceAccount:${local.sa_id}"
      ]
      lifecycle_policy = local.policy
    }
  }

}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

