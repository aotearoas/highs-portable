#!/usr/bin/env bash
set -e
# 0) 准备源码
git clone --depth 1 -b v1.7.0 https://github.com/ERGO-Code/HiGHS.git
cd HiGHS
# 1) Linux 静态
cmake --preset static-linux
cmake --build --preset linux
strip -s build-static-linux/bin/highs
# 2) 可选 UPX 压缩（17 MB → 5 MB）
command -v upx && upx -9 build-static-linux/bin/highs || true
# 3) 打包
tar -czf highs-v1.7.0-linux-x86_64.tar.gz -C build-static-linux/bin highs
echo "✅ 完成：highs-v1.7.0-linux-x86_64.tar.gz"