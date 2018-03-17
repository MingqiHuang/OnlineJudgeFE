#!/bin/sh

base=/OJ_FE

build_vendor_dll()
{
  if [ ! -e "${base}/build/vendor-manifest.json" ]
  then
      npm run build:dll
  fi
}
cd $base
npm install --registry=https://registry.npm.taobao.org && \
build_vendor_dll && \
npm run build

if [ $? -ne 0 ]; then
    echo "构建失败，请检查node版本和package.json文件"
    exit 1
fi

exec nginx -c /OJ_FE/deploy/nginx.conf
