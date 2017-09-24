#!/bin/sh -eux

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-key fingerprint 0EBFCD88 | grep '9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88' > /dev/null
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
stable edge"
apt-get -y update
apt-get -y install docker-ce
service docker start
groupadd docker || true
gpasswd -a vagrant docker
curl -fsSL https://github.com/docker/compose/releases/download/"$DOCKER_COMPOSE_VERSION"/docker-compose-"$(uname -s)"-"$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
sudo sed -i "s/^ExecStart\=.*/ExecStart\=\/usr\/bin\/dockerd/" /lib/systemd/system/docker.service
cat >/etc/docker/daemon.json <<EOF
{
	"hosts": ["tcp://0.0.0.0:$DOCKER_DAEMON_PORT, "unix:///var/run/docker.sock"],
	"storage-driver": "aufs"
}
EOF
