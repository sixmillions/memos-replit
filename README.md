# 介绍

在[replit](https://replit.com)上运行最新版[memos](https://github.com/usememos/memos)(v0.11.2)

> https://replit.com  
> https://github.com/usememos/memos  

![MEMOS](./img/memos-v0.11.2.png)

# 运行

## 方式1

1. clone本项目到replit，语言选择go
2. 运行main.sh

![创建repl](./img/create-repl.png)

![run](./img/run-main-sh.png)

![success](./img/run-success.png)

## 方式2

1. 参考下面的[构建方式](#构建方式)构建出memos
2. 将memos上传到replit
3. 运行main.sh

# 构建方式

## 构建思路

1. replit中go语言环境使用的是ubuntu20.04
2. 用同样的环境构建出memos，例如: [gitpod](https://gitpod.io)
3. copy到replit运行

## 具体步骤

### clone memos项目

```shell
git clone https://github.com/usememos/memos.git
# 切换到具体版本
cd memos && git checkout v0.11.2
```

### 构建前端

需要有node环境（略）

我这里用的具体版本是：

- node 16.19.0 
- yarn 1.22.19

```shell
# 在项目根目录下
cd ./web 

# web目录下
yarn && yarn build
```

将构建前端文件copy到 `server/dist` 下

```shell
# 回到项目根目录
cd ..
rm -rf ./server/dist && cp -r web/dist ./server/
```

### 构建memos

需要安装go语言环境（略）

我用的go语言版本是: go version go1.19.5 linux/amd64

```shell
# 回到项目根目录
go build -o memos ./main.go
```

这样就构建出来 `memos` 了

# 防止replit休眠

如果长时间不操作replit，replit会进入休眠

我们这里需要隔一段时间访问一下，使用定时任务

方式：

## linux系统crontab

```shell
2 * * * * curl 你memos地址 >/dev/null 2>&1
```

## cron-job

使用[cron-job](https://cron-job.org)效果一样 

注册cron-job -> 创建cron-job -> 配置cron-job -> 运行cron-job

![创建cron-job](./img/create-cron-job.png)

![cron-job](./img/cron-job-config.png)

