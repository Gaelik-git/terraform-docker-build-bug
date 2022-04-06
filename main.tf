resource "random_pet" "this" {
  length = 2
}

module "docker_image" {
  source = "terraform-aws-modules/lambda/aws//modules/docker-build"

  create_ecr_repo = true
  ecr_repo        = "${random_pet.this.id}-ecr-repo"
  image_tag       = "test-image"
  source_path     = "./"
}