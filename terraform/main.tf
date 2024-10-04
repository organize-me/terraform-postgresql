terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "= 3.0.1"
    }
  }
}

provider "docker" {
  host = var.docker_host
}

data "docker_network" "network" {
  name = var.docker_network
}
