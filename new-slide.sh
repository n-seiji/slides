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
echo "次の手順:"
echo "  1. $name/index.md を編集(見本: format-samples/index.md)"
echo "  2. make preview DECK=$name で見た目を確認"
echo "  3. make html DECK=$name で index.html を生成してコミット"
echo "  4. README.md のデッキ一覧に追記し、make index で Pages トップページを再生成"
