#!/bin/bash

# 检查必要参数（至少需要源文件）
[ $# -lt 1 ] && echo "用法: $0 <源文件> [输出目录] [宽度]" && exit 1

# 设置默认值
input="$1"
outdir="${2:-./compressed_gifs}"   # 默认输出目录
width="${3:-640}"                   # 默认宽度640

# 创建输出目录
mkdir -p "$outdir"

# 生成输出文件名
outfile="$outdir/$(basename "${input%.*}").gif"

# 获取原文件大小
orig_size=$(du -h "$input" | cut -f1)

# 执行压缩
gifsicle --resize-fit-width "$width" -O3 "$input" -o "$outfile"

# 获取压缩后大小
new_size=$(du -h "$outfile" | cut -f1)
saved=$(( ($(stat -c %s "$input") - $(stat -c %s "$outfile")) / 1024 ))

# 输出结果
echo "原文件: $orig_size"
echo "压缩后: $new_size (节省 ${saved}KB)"
echo "输出: $outfile"
