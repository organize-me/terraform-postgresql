resource "docker_image" "postgres" {
  name = "postgres:17"
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.image_id
  name  = "organize-me-postgres-db"
  network_mode = "bridge"
  wait = true

  healthcheck {
    test     = ["CMD-SHELL", "pg_isready -U ${var.postgres_root_user}"]
    interval = "30s"
    timeout  = "10s"
    retries  = 5
  }

  ports {
    internal = 5432
    external = 5432
  }

  env = [
    "TZ=${var.timezone}",
    "POSTGRES_USER=${var.postgres_root_user}",
    "POSTGRES_PASSWORD=${var.postgres_root_password}"
  ]

  volumes {
    host_path      = var.postgres_volume_path
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = data.docker_network.network.name
    aliases = ["postgres"]
  }
}


