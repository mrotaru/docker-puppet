# Puppet inside a Docker image

Simple hello-world type Docker image. Installs Puppet and applies a simple
manifest. Note that Puppet should probably be used to manage the Docker host,
having Puppet in Docker containers is not a good idea for production.
