#!/bin/bash

echo "down load memos ${version} >>> $(date '+%Y-%m-%d %H:%M:%S')"

# 下载memos
if [ ! -e memos ];then
    if [ $# -eq 1 ]; then
      # 下载指定版本
      version=$1
    else
      # 下载最新版
      version="$(curl -fsSLI -o /dev/null -w "%{url_effective}" https://github.com/sixmillions/memos-replit/releases/latest)"
      version="${version#https://github.com/sixmillions/memos-replit/releases/tag/}"
    fi
    wget https://github.com/sixmillions/memos-replit/releases/download/${version}/memos
fi

echo "run memos >>> $(date '+%Y-%m-%d %H:%M:%S')"

# 可指定权限
chmod +x ./memos

# 数据库文件存放的地方
if [ ! -d ./db ];then
    mkdir ./db
fi

# 图片缓存位置
if [ ! -d ./db/.thumbnail_cache ];then
    mkdir ./db/.thumbnail_cache
fi

MEMOS_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co

echo "click url: $MEMOS_URL"

# 运行memos
./memos --data ./db --mode prod --port 6969
