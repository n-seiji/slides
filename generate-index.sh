#!/bin/sh
# 各デッキの README.md からトップページ index.html を生成する
# 使い方: ./generate-index.sh (または mise run index)
set -eu

if ! command -v jq >/dev/null 2>&1; then
  echo "エラー: jq が必要です" >&2
  exit 1
fi

cd "$(dirname "$0")"

# デッキ情報を「日付|ディレクトリ|タイトル|イベント」形式で収集(日付降順)
rows=$(
  for d in */; do
    d="${d%/}"
    [ "$d" = "template" ] && continue
    [ -f "$d/index.html" ] || continue
    title=$(sed -n '1s/^# //p' "$d/README.md" 2>/dev/null || true)
    event=$(sed -n 's/^- イベント: *//p' "$d/README.md" 2>/dev/null || true)
    date=$(sed -n 's/^- 日付: *//p' "$d/README.md" 2>/dev/null || true)
    printf '%s|%s|%s|%s\n' "${date:-0000/00/00}" "$d" "${title:-$d}" "${event:-}"
  done | sort -r
)

{
  cat <<'HEADER'
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>slides — n-seiji</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;700&display=swap" rel="stylesheet" />
<style>
  :root {
    --foreground: #cbcbcb;
    --background: #000000;
    --primary: #ff6362;
    --dimmed: #888888;
  }
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: "Noto Sans JP", sans-serif;
    background: var(--background);
    color: var(--foreground);
    max-width: 720px;
    margin: 0 auto;
    padding: 3rem 1.5rem;
  }
  h1 { color: var(--primary); margin-bottom: 0.5rem; }
  .sub { color: var(--dimmed); margin-bottom: 2.5rem; }
  ul { list-style: none; }
  li { margin-bottom: 1.25rem; }
  a {
    color: var(--foreground);
    text-decoration: none;
    font-weight: 700;
    font-size: 1.1rem;
  }
  a:hover { color: var(--primary); }
  .meta { color: var(--dimmed); font-size: 0.85rem; margin-top: 0.2rem; }
</style>
</head>
<body>
<h1>slides</h1>
<p class="sub">n-seiji の発表スライド</p>
<ul>
HEADER

  escape_html() {
    printf '%s' "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
  }

  printf '%s\n' "$rows" | while IFS='|' read -r date dir title event; do
    meta="$event"
    [ "$date" != "0000/00/00" ] && meta="${event:+$event / }$date"
    printf '  <li><a href="%s/">%s</a>\n' "$dir" "$(escape_html "$title")"
    [ -n "$meta" ] && printf '    <div class="meta">%s</div>\n' "$(escape_html "$meta")"
    printf '  </li>\n'
  done

  cat <<'FOOTER'
</ul>
</body>
</html>
FOOTER
} > index.html

slides='[]'

for d in */; do
  d="${d%/}"
  [ "$d" = "template" ] && continue
  [ -f "$d/index.html" ] || continue
  [ -f "$d/README.md" ] || continue
  grep -q '^- イベント:' "$d/README.md" || continue
  grep -q '^- 日付:' "$d/README.md" || continue
  grep -q '^- 掲載: しない$' "$d/README.md" && continue

  title=$(sed -n '1s/^# //p' "$d/README.md")
  event=$(sed -n 's/^- イベント: *//p' "$d/README.md" | sed -n '1p')
  date=$(sed -n 's/^- 日付: *//p' "$d/README.md" | sed -n '1p')
  event_url=$(sed -n 's/^- 発表 URL: *//p' "$d/README.md" | sed -n '1p')
  description=$(sed -n 's/^- 説明: *//p' "$d/README.md" | sed -n '1p')
  tags=$(sed -n 's/^- タグ: *//p' "$d/README.md" | sed -n '1p')
  tags_json=$(jq -cn --arg tags "$tags" \
    '$tags | split(",") | map(gsub("^\\s+|\\s+$"; "")) | map(select(length > 0))')

  item=$(jq -cn \
    --arg slug "$d" \
    --arg title "${title:-$d}" \
    --arg event "$event" \
    --arg date "$date" \
    --arg slideUrl "https://n-seiji.github.io/slides/$d/" \
    --arg eventUrl "$event_url" \
    --arg description "$description" \
    --argjson tags "$tags_json" \
    '{
      slug: $slug,
      title: $title,
      event: $event,
      date: $date,
      slideUrl: $slideUrl,
      eventUrl: ($eventUrl | if length == 0 then null else . end),
      description: ($description | if length == 0 then null else . end),
      tags: $tags
    }')
  slides=$(jq -cn --argjson slides "$slides" --argjson item "$item" '$slides + [$item]')
done

printf '%s\n' "$slides" | jq 'sort_by(.date) | reverse' > slides.json

echo "生成しました: index.html"
