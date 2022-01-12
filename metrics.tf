resource "docker_image" "metrics" {
  name = "metrics"

  build {
    path = "."
    tag  = ["metrics:play"]
  }

  provisioner "local-exec" {
    command = "kind load docker-image --name play metrics:play"
  }
}
