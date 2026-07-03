# CLAUDE.md

Marp 製スライドのリポジトリ。1 ディレクトリ = 1 発表デッキ。

## コマンド

- 新規デッキ: `make new NAME=<name> COLOR="#xxxxxx"`(内部で `new-slide.sh` を実行)
- プレビュー: `make serve`
- ビルド: `make html DECK=<name>` / `make pdf DECK=<name>` / `make pptx DECK=<name>`

## 構成と規約

- テーマは `themes/mamansoft.css` が唯一の正。**デッキに CSS をコピーしない**
- デッキ固有の primary 色は `index.md` 冒頭の `<style>:root { --color-primary: ... }</style>` で上書き
- ページパターンの見本は `format-samples/`(1 スライド = 1 パターン、コピペして使う)
- 使えるフォーマット(CSS クラス)は `docs/format-catalog.md` を参照。新フォーマットが必要なら
  デッキ内 `<style scoped>` で済ませず、汎用性があるものはテーマに追加してカタログも更新する
- 画像は各デッキの `resources/` に置く
- `index.html` はコミット対象。`index.md` を編集したら `make html DECK=<name>` で再生成してからコミット
- PDF / pptx はコミットしない(.gitignore 済み)
- スライド・ドキュメントは日本語
- コミットメッセージは `<type>: <説明>`(feat / fix / refactor / docs / chore)

## 新しいデッキを作るとき

1. `make new NAME=<name>` で作成
2. `index.md` の表紙タイトル・日付・アジェンダを編集
3. `make serve` で確認しながら執筆
4. `make html DECK=<name>` で index.html を生成してコミット
