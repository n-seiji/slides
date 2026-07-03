#!/bin/sh
# 新規スライドデッキを template/ から作成する
# 使い方: ./new-slide.sh <デッキ名> [primary色 (例: "#ff6362")]
set -eu

if [ $# -lt 1 ]; then
  echo "使い方: $0 <デッキ名> [primary色]" >&2
  exit 1
fi

name="$1"
color="${2:-#ff6362}"
date="$(date +%Y/%m/%d)"

cd "$(dirname "$0")"

if [ -e "$name" ]; then
  echo "エラー: '$name' は既に存在します" >&2
  exit 1
fi

cp -R template "$name"

for f in "$name/index.md" "$name/README.md"; do
  sed -i '' \
    -e "s|{{TITLE}}|$name|g" \
    -e "s|{{DATE}}|$date|g" \
    -e "s|{{COLOR}}|$color|g" \
    "$f"
done

echo "作成しました: ./$name"
echo "次の手順: $name/index.md のタイトルを編集 → make html DECK=$name"
