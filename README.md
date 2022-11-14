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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.47.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_container_registry.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_registry) | resource |
| [yandex_container_registry_iam_binding.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_registry_iam_binding) | resource |
| [yandex_container_repository.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_repository) | resource |
| [yandex_container_repository_iam_binding.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_repository_iam_binding) | resource |
| [yandex_container_repository_lifecycle_policy.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_repository_lifecycle_policy) | resource |
| [yandex_resourcemanager_folder.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/resourcemanager_folder) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | Folder that the resource belongs to. If value is omitted, the default provider folder is used | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Container registry labels | `map(string)` | `{}` | no |
| <a name="input_members"></a> [members](#input\_members) | The role that should be applied | `list(string)` | <pre>[<br>  "system:allUsers"<br>]</pre> | no |
| <a name="input_registry"></a> [registry](#input\_registry) | Container registry name | `string` | n/a | yes |
| <a name="input_repos"></a> [repos](#input\_repos) | Repositories with role binding and lifecycle\_policy | `map(any)` | `{}` | no |
| <a name="input_role"></a> [role](#input\_role) | The role that should be applied | `string` | `"puller"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_registry_id"></a> [registry\_id](#output\_registry\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

