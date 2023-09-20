module "common" {
  source = "../common"
}

module "toastmaster" {
  source = "../binding-secret-sa-toastmaster"
}
