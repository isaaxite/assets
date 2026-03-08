#!/bin/bash

# 目标目录
TARGET_DIR="/home/isaac/Workspace/gh-assets/blog"

# 检查目标目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
    echo "错误：目标目录 $TARGET_DIR 不存在"
    exit 1
fi

# 将文件名列表直接嵌入脚本
FILES_TO_DELETE=(
"Snipaste_2023-04-11_17-10-19.png"
"Snipaste_2023-04-11_17-12-21.png"
"Snipaste_2023-04-11_17-29-31.png"
"Snipaste_2023-04-11_17-33-25.png"
"Snipaste_2023-04-11_17-36-34.png"
"Snipaste_2023-04-11_18-49-48.png"
"Snipaste_2023-05-30_17-44-00.png"
"Snipaste_2023-05-30_17-47-09.png"
"Snipaste_2023-06-08_12-29-52.png"
"Snipaste_2023-06-08_15-51-31.png"
"Snipaste_2023-06-08_19-25-08.png"
"Snipaste_2023-06-09_10-51-41.png"
"Snipaste_2023-06-09_11-12-25.png"
"Snipaste_2023-06-09_11-23-46.png"
"Snipaste_2023-06-09_11-32-44.png"
"Snipaste_2023-06-09_12-17-53.png"
"Snipaste_2023-06-09_12-18-21.png"
"Snipaste_2023-06-09_12-18-38.png"
"Snipaste_2023-06-09_12-25-21.png"
"Snipaste_2023-07-09_18-34-17.png"
"Snipaste_2023-07-09_19-15-39.png"
"Snipaste_2023-07-10_10-59-57.png"
"Snipaste_2023-07-10_11-35-16.png"
"Snipaste_2023-07-10_11-42-51.png"
"Snipaste_2023-07-10_12-18-35.png"
"Snipaste_2023-07-10_15-27-04.png"
"Snipaste_2023-07-10_16-17-01.png"
"Snipaste_2023-07-10_16-20-05.png"
"Snipaste_2023-07-10_16-22-24.png"
"Snipaste_2023-07-25_18-23-41.png"
"Snipaste_2023-07-25_18-24-32.png"
"Snipaste_2023-07-26_11-28-57.png"
"Snipaste_2023-07-26_11-57-45.png"
"Snipaste_2023-07-26_20-14-55.png"
"Snipaste_2023-07-26_21-57-36.png"
"Snipaste_2023-07-27_04-51-22.png"
"Snipaste_2023-07-28_05-21-19.png"
"Snipaste_2023-07-28_05-24-55.png"
"Snipaste_2023-07-28_05-29-46.png"
"Snipaste_2023-07-28_05-37-08.png"
"Snipaste_2023-07-28_05-47-19.png"
"Snipaste_2023-07-28_05-56-33.png"
"Snipaste_2023-07-28_05-58-21.png"
"Snipaste_2023-07-28_06-07-20.png"
"Snipaste_2023-07-28_06-15-52.png"
"Snipaste_2023-07-28_06-17-14.png"
"Snipaste_2023-07-28_06-27-26.png"
"Snipaste_2023-07-28_11-41-51.png"
"Snipaste_2023-07-28_12-33-57.png"
"Snipaste_2023-07-28_13-14-02.png"
"Snipaste_2023-07-28_13-20-52.png"
"Snipaste_2023-08-07_00-58-17.png"
"Snipaste_2023-08-18_03-04-03.png"
"Snipaste_2023-08-18_09-50-26.png"
"Snipaste_2023-08-18_10-34-47.png"
"Snipaste_2023-08-18_16-31-22.png"
"Snipaste_2023-08-19_10-22-00.png"
"Snipaste_2023-08-19_10-29-37.png"
"Snipaste_2023-08-19_13-52-51.png"
"Snipaste_2023-08-19_18-24-50.png"
"Snipaste_2023-08-19_18-55-58.png"
"Snipaste_2023-08-19_19-18-41.png"
"Snipaste_2023-08-19_20-34-36.png"
"Snipaste_2023-08-20_02-14-17.png"
"Snipaste_2023-08-20_02-15-28.png"
"Snipaste_2023-08-20_02-38-41.png"
"Snipaste_2023-08-20_02-39-58.png"
"Snipaste_2023-08-20_20-42-23.png"
"Snipaste_2023-08-20_20-45-58.png"
"Snipaste_2023-08-20_20-48-09.png"
"Snipaste_2023-08-20_20-49-48.png"
"Snipaste_2023-08-20_21-42-41.png"
"Snipaste_2023-08-24_02-13-11.png"
"Snipaste_2023-08-24_02-40-55.png"
"Snipaste_2023-08-24_05-44-28.png"
"Snipaste_2023-08-24_10-00-57.png"
"Snipaste_2023-08-24_10-04-20.png"
"Snipaste_2023-08-24_10-05-38.png"
"Snipaste_2023-08-24_10-06-16.png"
"Snipaste_2023-08-26_18-37-50.png"
"Snipaste_2023-08-26_18-51-04.png"
"Snipaste_2023-08-27_02-21-07.png"
"Snipaste_2023-08-27_02-28-03.png"
"Snipaste_2023-08-27_10-51-02.png"
"Snipaste_2023-08-27_10-52-47.png"
"Snipaste_2023-08-27_10-56-23.png"
"Snipaste_2023-08-27_10-59-57.png"
"Snipaste_2023-08-30_10-02-04.png"
"Snipaste_2023-08-30_17-35-51.png"
"Snipaste_2023-08-30_17-36-22.png"
"Snipaste_2023-08-30_17-37-14.png"
"Snipaste_2023-08-30_20-27-01.png"
"Snipaste_2023-08-30_20-37-11.png"
"Snipaste_2023-08-31_15-30-56.png"
"Snipaste_2023-08-31_15-55-07.png"
"Snipaste_2023-08-31_15-58-54.png"
"Snipaste_2023-08-31_19-11-09.png"
"tinified-2025-11-20-10-35-45.png"
"tinified-2025-12-19-07-36-06.png"
"tinified-2025-12-20-00-54-33.png"
"tinified-2025-12-20-01-33-48.png"
"tinified-2025-12-21-08-27-06.png"
"tinified-2025-12-21-09-07-35.png"
"tinified-2025-12-23-06-59-31.png"
"tinified-2025-12-23-07-41-00.png"
"tinified-2025-12-23-08-01-54.png"
"tinified-2025-12-23-08-19-52.png"
"tumblr_lkhe2jxnXS1qguzn1o1_r7_1280.png"
"微信图片_20230409122211.jpg"
"微信图片_20230409122619.jpg"
"微信图片_20230410152338.jpg"
"微信图片_20230410152749.jpg"
"微信图片_20230410153733.jpg"
"微信图片_20230411174209.jpg"
"微信图片_20230411175239.jpg"
"微信图片_20230411175425.jpg"
"微信图片_20230411175908.jpg"
)

echo "开始删除文件从: $TARGET_DIR"
echo "-----------------------------------"

# 计数器
deleted=0
not_found=0

# 遍历文件列表并删除
for filename in "${FILES_TO_DELETE[@]}"; do
    file_path="$TARGET_DIR/$filename"
    
    if [ -f "$file_path" ]; then
        # 文件存在，删除
        rm "$file_path"
        echo "已删除: $filename"
        ((deleted++))
    else
        # 文件不存在
        echo "文件不存在: $filename"
        ((not_found++))
    fi
done

echo "-----------------------------------"
echo "删除操作完成！"
echo "成功删除: $deleted 个文件"
echo "文件不存在: $not_found 个"

# 显示剩余文件统计（可选）
remaining=$(find "$TARGET_DIR" -type f | wc -l)
echo "目标目录剩余文件数: $remaining"

