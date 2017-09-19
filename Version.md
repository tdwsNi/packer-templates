### tdwsni/debian9.1-amd64-docker packer template

[Packer](https://www.packer.io/) template for a minimal amd64 [Debian 9.1 (Stretch)](https://wiki.debian.org/DebianStretch) [Vagrant](https://www.vagrantup.com/) image with [Docker](https://docker.io) and [Docker Compose](https://docs.docker.com/compose/) for [VMware](https://www.vmware.com/) providers. Preconfigured docker daemon configuration allows client (vagrant host) connection via TCP port `2375`.

#### template repository: [https://github.com/tdwsni/packer-templates](https://github.com/tdwsNi/packer-templates/debian9.1-amd64-docker)

#### default box configuration:

*   base image: [debian-9.1.0-amd64-netinst.iso](http://cdimage.debian.org/cdimage/release/9.1.0/amd64/iso-cd/debian-9.1.0-amd64-netinst.iso)
*   docker: 17.07.0-ce
*   docker-compose: 1.16.1
*   default username/password: vagrant
*   hostname: docker.local
*   cpu: 2 (coresPerSocket = 1)
*   memory: 2048
*   virtual hardware version: 12

_*tested on vmware fusion 8.5 with virtual hardware version 12*_

```text
changelog:

- 1.1.
  * update docker-ce to 17.07.0-ce
  * update docker-compose to 1.16.1
  * add template repository to readme
  * add changelog
  * set vmware virtual hardware version to 12
  * fix default hostname provision as "docker.local"

- 1.0.20170912
  * initial box upload to vagrant cloud
```
