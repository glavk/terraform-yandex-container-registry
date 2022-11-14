locals {
  policy = {
    expire_period = "48h"
  }
  sa_id = "xxx"
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