# 介绍

在[replit](https://replit.com)上运行最新版[memos](https://github.com/usememos/memos)(v0.21.0)

> https://replit.com  
> https://github.com/usememos/memos  

# 版本升级

目前还不是自动构建，有新版memos可以email我一下，我快速构建一下

**升级一时爽，数据火葬场！！！！注意备份数据**

```bash
# 先备份数据
zip memeos-db.zip -qr db/*
# 然后下载该数据，这个就是你的数据库

# 备份旧的memos
mv memos memos.bk

# 安装最新版（本项目构建的最新版）
bash main.sh
```

- v0.21.0 **最新** [升级问题](./docs/qa/v0.21.0.md)

# 运行

## 方式1

1. 打开我创建的[模板地址](https://replit.com/@sixmillions/memos-replit)
2. 点击右上角 `Use Template`

![use-template](./img/use-template.png)

## 方式2

[自己构建](./docs/custom-build.md)

# releases log

下面的版本需要切换到 memos_v0.13.x 分支
- v0.13.1 
- v0.13.0 [升级问题](./docs/qa/v0.13.0.md)
- v0.12.2
- v0.11.2

# 最后

感谢Memos开源社区的各位大佬

