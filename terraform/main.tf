terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "myapp" {
  name = "kathirvel22/myapp"
}

resource "docker_container" "myapp_container" {
  name  = "myapp-container"
  image = docker_image.myapp.image_id

  ports {
    internal = 5000
    external = 5001
  }
}