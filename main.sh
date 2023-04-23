#!/bin/bash

if [ $# -eq 1 ]; then
  version=$1
else
  version="$(curl -fsSLI -o /dev/null -w "%{url_effective}" https://github.com/sixmillions/memos-replit/releases/latest)"
  version="${version#https://github.com/sixmillions/memos-replit/releases/tag/}"
fi

echo "down load memos ${version} >>> $(date '+%Y-%m-%d %H:%M:%S')"

rm -rf memos && wget https://github.com/sixmillions/memos-replit/releases/download/${version}/memos

echo "run memos >>> $(date '+%Y-%m-%d %H:%M:%S')"

chmod +x ./memos

# 数据库文件存放的地方
if [ ! -d ./db ];then
    mkdir ./db
fi

MEMOS_URL=https://${REPL_SLUG}.${REPL_OWNER}.repl.co

echo "click url: $MEMOS_URL"

./memos --data ./db --mode prod --port 6969