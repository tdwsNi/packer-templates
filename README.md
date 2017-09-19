# tdwsni/debian9.1-amd64-docker packer template

[Packer](https://www.packer.io/) template for a minimal amd64 [Debian 9.1 (Stretch)](https://wiki.debian.org/DebianStretch) [Vagrant](https://www.vagrantup.com/) image with [Docker](https://docker.io) and [Docker Compose](https://docs.docker.com/compose/) for [VMware](https://www.vmware.com/) providers. Preconfigured docker daemon configuration allows client (vagrant host) connection via TCP port `2375`.

#### [Releases](https://app.vagrantup.com/tdwsNi/boxes/debian9.1-amd64-docker) - [Changelog](CHANGELOG.md)

---

## Usage

You can install pre-built boxes via [Vagrant Cloud](https://app.vagrantup.com/tdwsNi/boxes/debian9.1-amd64-docker):

```bash
$ vagrant box add tdwsNi/debian9.1-amd64-docker
```
### Building

#### Prerequisites

-   [Vagrant](https://www.vagrantup.com)
-   [Packer](https://packer.io)
-   [VMware Fusion](https://www.vmware.com/products/fusion/overview.html) / [VMware Workstation](https://www.vmware.com/products/workstation/)
-   [vagrant-wmvare-fusion](https://www.vagrantup.com/docs/vmware/installation.html) / [vagrant-wmvare-workstation](https://www.vagrantup.com/docs/vmware/installation.html)

Clone the repository:

```bash
$ git clone https://github.com/tdwsni/packer-templates && cd packer-templates
```

Build a box image with packer and upload to vagrant-cloud:

```bash
$ packer build debian9.1-amd64-docker.json
```

### Configuration

Template file designed with several user variables to use as a "base template" for packer. The following parameters can be set at build time by supplying -var command line options to packer:

User Variable            | Description                                                                                                                             | Default Value
-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------
`template_base`          | base box name                                                                                                                           | `debian9.1-amd64`
`template_config`        | custom box image configuration                                                                                                          | `docker`
`img_ver`                | [box base version](https://www.packer.io/docs/post-processors/vagrant-cloud.html#version)                                               | 1.1
`build_ver`              | [build version](https://www.packer.io/docs/templates/engine.html#isotime-function-format-reference)                                     | `{{isotime \"20060102\"}}`
`compression_level`      | [compression level of box image](https://www.packer.io/docs/post-processors/vagrant.html#compression_level)                             | `9`
`output directory`       | [path to the build directory](https://www.packer.io/docs/builders/vmware-iso.html#output_directory)                                     | `builds`
`vcloud_user`            | [vagrant cloud user / organization name](https://www.vagrantup.com/docs/vagrant-cloud/users/index.html)                                 | value of `VAGRANT_CLOUD_USER` environment variable
`vcloud_token`           | [vagrant cloud token](https://www.packer.io/docs/post-processors/vagrant-cloud.html#access_token)                                       | value of `VAGRANT_CLOUD_TOKEN` environment variable
`cpus`                   | number of cpus of vm                                                                                                                    | `2`
`memory`                 | memory size of vm in MB                                                                                                                 | `2048`
`disk_size`              | disk size of vm in MB                                                                                                                   | `40960`
`host_name`              | host name of vm                                                                                                                         | `docker.local`
`vmx_version`            | [virtual hardware version of vm](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1003746) | `12`
`docker_daemon_port`     | [tcp port of docker daemon to listen](https://docs.docker.com/engine/reference/commandline/dockerd/#Daemon%20socket%20option)           | `2375`
`docker_compose_version` | [docker-compose version to install](https://github.com/docker/compose/releases)                                                         | `1.16.1`
`mirror`                 | URL to the installation image download mirror base                                                                                      | `http://cdimage.debian.org/cdimage/release`
`mirror_directory`       | path to the desired version of installation image                                                                                       | `9.1.0/amd64/iso-cd`
`iso_name`               | installation image file name                                                                                                            | `debian-9.1.0-amd64-netinst.iso`
`iso_checksum`           | checksum for the image file                                                                                                             | `c9e070074de83aa22e141f59a423e5210a5019b369ef1efe61a2afd44ba8f371`
`iso_checksum_type`      | type of the checksum                                                                                                                    | `sha256`
`preseed_path`           | [preseed file name for the auto installation](https://www.debian.org/releases/stretch/amd64/apb.html.en)                                | `preseed.cfg`

#### Further Reading:

-   [Packer Documentation](https://www.packer.io/docs/)
-   [Vagrant Documentation](https://www.vagrantup.com/docs/)
-   [VMware Documentation](https://docs.vmware.com)

---

### License

This template is based on the [Bento](https://github.com/chef/bento) project.

```text
Copyright 2012-2017, Chef Software, Inc. (<legal@chef.io>)
Copyright 2011-2012, Tim Dysinger (<tim@dysinger.net>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

[Ni!](mailto:Ni@tdwsNi.net), 2017
