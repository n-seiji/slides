# format-samples

スライドのページパターン見本集。1 スライド = 1 パターン(全 14 種)。

- `make serve` で見た目を確認しながら、必要なスライドを自分のデッキにコピペする
- 各スライド冒頭のコメントがパターン名
- 部品(CSS クラス)単位の説明は `docs/format-catalog.md` を参照

## パターン一覧

1. 表紙(`slide-title`)
2. 自己紹介(`item` + `label`)
3. 章区切り・アジェンダ(`chapter-divider`)
4. 1 メッセージ(`lead`)
5. 箇条書き
6. 番号付きステップ
7. 画像 1 枚 + キャプション(`![center]` + `note`)
8. 全面画像 + ナレーション(`full lead narration-white`)
9. 左画像 + 右テキスト(`![bg left]`)
10. 2 カラム比較(`grid-5-5`)
11. 表による比較
12. 引用(`blockquote`)
13. コード + 説明(`grid-col-5-5`)
14. 最終スライド(`slide-last`)

## ビルド

リポジトリルートで `make html DECK=format-samples`
