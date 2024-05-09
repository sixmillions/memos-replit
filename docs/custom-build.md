# 说明

replit系统版本是ubuntu20.04

为了memos能在上面运行，需要找到对应的版本构建

# 构建

gitpod上操作的

```
docker run -itd --privileged  --name u20 --hostname six -v /tmp/u20:/home/u20 ubuntu:20.04

cd /tmp/u20

git clone https://github.com/usememos/memos.git

cd memos && git checkout v0.21.0

cd ./web && yarn && yarn build

cd .. && mkdir memos-build-res && cp -r ./web/dist memos-build-res/

# 将项目copy映射目录

cp -r memos /tmp/u20

docker exec -it u20 bash

apt-get update -y

apt install -y vim wget net-tools git curl

wget https://golang.org/dl/go1.22.3.linux-amd64.tar.gz

tar -xzf go1.19..22.3x-amd64.tar.gz -C /usr/local/

vim /etc/profile

export PATH=$PATH:/usr/local/go/bin

source /etc/profile

go version

cd /home/u20/memos

go build -o memos-build-res/memos ./bin/memos/main.go

cd memos-build-res/

zip -r memos-replit.zip dist memos
```
