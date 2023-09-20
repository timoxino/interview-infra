module "common" {
  source = "interview-infra/common"
}

module "toastmaster" {
  source = "interview-infra/binding-secret-sa-toastmaster"
}