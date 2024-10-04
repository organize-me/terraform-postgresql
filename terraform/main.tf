# Terraform configuration block specifying the required providers.
terraform {
  required_providers {
    # Specifies the Docker provider with the source and version.
    docker = {
      source  = "kreuzwerker/docker"
      version = "= 3.0.2"
    }
  }
}

# Configures the Docker provider with the specified host.
provider "docker" {
  host = var.docker_host
}

# Data source to fetch information about a Docker network.
data "docker_network" "network" {
  # Name of the Docker network to fetch.
  name = var.docker_network
}
