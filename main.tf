terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "my-nginx-container"
  image = docker_image.nginx.image_id
  ports {
    internal = 80 # NGINX listens on this inside the container
    external = 8080 # Accessible via <Public_IP>:8080
  }
}
