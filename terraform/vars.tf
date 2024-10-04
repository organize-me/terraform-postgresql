# --== General ==-- #
variable "timezone" {
  description = "The timezone to use for the server"
  type        = string
}

# --== Docker ==-- #
variable "docker_host" {
  description = "The Docker host to connect to"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "docker_network" {
  description = "The Docker network to connect to"
  type        = string
}

# --== PostgreSQL ==-- #

variable "postgres_root_user" {
  description = "The PostgreSQL username"
  type        = string
}

variable "postgres_root_password" {
  description = "The PostgreSQL password"
  type        = string
}

variable "postgres_volume_path" {
  description = "The path to the volume to use for the PostgreSQL data"
  type        = string
}