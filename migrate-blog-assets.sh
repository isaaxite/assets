#!/bin/bash

# 源目录和目标目录
SOURCE_DIR="/home/isaac/Workspace/blog/source/_posts"
TARGET_DIR="/home/isaac/Workspace/gh-assets/blog"

# 支持的文件类型（图片、PDF、音频等）
FILE_EXTENSIONS="\.(jpg|jpeg|png|gif|bmp|svg|webp|ico|pdf|aac|mp3|wav|ogg|m4a|flac|webm|mp4|mov|avi)$"

# 创建目标目录（如果不存在）
mkdir -p "$TARGET_DIR"

# 计数器
total=0
skipped=0
renamed=0

echo "开始复制资源文件..."

# 使用 find 命令查找所有文件（排除 .md 文件）
while IFS= read -r file; do
    # 获取文件名
    filename=$(basename "$file")
    
    # 检查文件扩展名是否匹配
    if [[ $filename =~ $FILE_EXTENSIONS ]]; then
        # 目标文件路径
        target_file="$TARGET_DIR/$filename"
        
        # 检查目标文件是否已存在
        if [ -e "$target_file" ]; then
            # 文件已存在，生成8位hash值
            # 使用源文件的路径和修改时间生成hash，确保唯一性
            file_hash=$(echo "$file$(stat -c %Y "$file")" | md5sum | cut -c1-8)
            
            # 分离文件名和扩展名
            base_name="${filename%.*}"
            extension="${filename##*.}"
            
            # 新文件名：原文件名_hash.扩展名
            new_filename="${base_name}_${file_hash}.${extension}"
            target_file="$TARGET_DIR/$new_filename"
            
            echo "文件已存在，重命名: $filename -> $new_filename"
            ((renamed++))
        fi
        
        # 复制文件
        cp "$file" "$target_file"
        echo "已复制: $filename"
        ((total++))
    fi
done < <(find "$SOURCE_DIR" -type f ! -name "*.md")

echo "-----------------------------------"
echo "复制完成！"
echo "总计复制文件: $total"
echo "其中重命名文件: $renamed"
echo "目标目录: $TARGET_DIR"

# 显示目标目录中的文件统计
if [ $total -gt 0 ]; then
    echo -e "\n目标目录文件列表:"
    ls -lh "$TARGET_DIR" | head -20
    
    file_count=$(ls -1 "$TARGET_DIR" | wc -l)
    if [ $file_count -gt 20 ]; then
        echo "... 共 $file_count 个文件"
    fi
fi

