#!/usr/bin/env bash

# Directories to search and delete from
SEARCH_DIRS=(
  "/home/isaac/Workspace/gh-assets/blog"
  "/home/isaac/Downloads/tinified"
)

# List of unreferenced filenames to delete
FILENAMES=(
  "file-20250325163534211.png"
  ".png"
  "Snipaste_2023-08-05_14-46-53.png"
  "_plan.md"
  "image-20240419032104777.png"
  "lerna create pkg.gif"
  "微信图片_20240120160529.jpg"
  "微信图片_20240120160539.jpg"
  "_playground.md"
  "code_gen.js"
  "errBinarySearch.js"
  "test.js"
  "算法.第4版.pdf"
  "编程珠玑（第2版）.pdf"
  "image-20200420222553641.png"
  "2838289-1ed4d8357195e4af.png"
  "2023-10-15_12-36.png"
  "2023-10-15_12-45.png"
  "2023-10-16_11-13.png"
  "Snipaste_2023-07-09_18-34-17.png"
  "Snipaste_2023-07-09_19-15-39.png"
  "Snipaste_2023-07-10_11-35-16.png"
  "2838289-bd35ee9e30c8de53.webp"
  "Dependency cruiser.png"
  "Rollup Plugin Visualizer.png"
  "Snipaste_2023-08-24_02-13-11.png"
  "Snipaste_2023-08-24_10-00-57.png"
  "Snipaste_2023-08-24_10-04-20.png"
  "Snipaste_2023-08-27_10-51-02.png"
  "Snipaste_2023-08-27_10-52-47.png"
  "eslint-init-01.gif"
  "eslint-init-02.gif"
  "image.png"
  "Snipaste_2023-08-18_10-34-47.png"
  "image-1.png"
  "image-2.png"
  "image-3.png"
  "image-4.png"
  "AW1YkMTrWYUNmtTaRM0q.webp"
  "hjccQNanPjTDpIajkhPU.webp"
  "998023-20180519212357826-1474719173.png"
  "ast.jpg"
  "attrs.png"
  "element.jpg"
  "Snipaste_2023-04-06_21-37-44.png"
  "tinified-2025-11-20-10-35-45.png"
  "2023-12-09_23-11 copy.png"
  "2023-12-15_00-00.png"
  "9d7eb4d995694e41a597794b7f337b81 copy.png"
  "p8-练习曲.aac"
  "p9-练习曲.aac"
  "刑法.pdf"
  "Snipaste_2023-03-10_22-08-20.png"
)

deleted=0
not_found=0

for dir in "${SEARCH_DIRS[@]}"; do
  if [[ ! -d "$dir" ]]; then
    echo "⚠️  Directory not found, skipping: $dir"
    continue
  fi

  echo "🔍 Searching in: $dir"

  for filename in "${FILENAMES[@]}"; do
    # Use find with -name to locate by filename anywhere under the directory
    while IFS= read -r -d '' filepath; do
      echo "  🗑️  Deleting: $filepath"
      rm -- "$filepath"
      ((deleted++))
    done < <(find "$dir" -type f -name "$filename" -print0)
  done
done

echo ""
echo "✅ Done. Deleted $deleted file(s)."
