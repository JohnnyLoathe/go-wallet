#!/bin/bash

if [ -z "$VERSION" ]; then
  echo 'Please specify a version. e.g, "VERSION=1.11.2 sh install-go.sh"'
  exit
fi

export GO_DOWNLOAD_URL=https://storage.googleapis.com/golang/go$VERSION.linux-amd64.tar.gz

export GOPATH=/workspace
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

sudo mkdir ${GOPATH}
sudo chown ${USER} -R ${GOPATH}

sudo apt update
sudo apt install --no-install-recommends -y \
    software-properties-common ca-certificates build-essential

wget "$GO_DOWNLOAD_URL" -O golang.$VERSION.tar.gz
tar -zxvf golang.$VERSION.tar.gz
sudo mv go ${GOROOT}

echo "Installed Go v$VERSION"
go version