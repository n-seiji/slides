# CLAUDE.md

Marp 製スライドのリポジトリ。1 ディレクトリ = 1 発表デッキ。

## コマンド

| 目的 | コマンド |
|------|---------|
| 新規デッキ作成 | `make new NAME=<name> COLOR="#xxxxxx"` |
| 全デッキのビルド確認 | `make check` |
| HTML 生成(コミット対象) | `make html DECK=<name>` |
| スライドを PNG に出力(視覚確認用) | `make preview DECK=<name>` → `<name>/.preview/slide.001.png ...` |
| プレビューサーバ(人間用) | `make serve` |
| PDF / pptx | `make pdf DECK=<name>` / `make pptx DECK=<name>` |

## スライド編集のワークフロー

1. ページパターンの見本 `format-samples/index.md` から必要なスライドをコピーして編集する
   (1 スライド = 1 パターン、冒頭コメントがパターン名。CSS クラスの詳細は `docs/format-catalog.md`)
2. 編集したら `make preview DECK=<name>` で PNG を生成し、**Read ツールで画像を見て崩れを確認する**
3. 問題なければ `make html DECK=<name>` で index.html を再生成してコミット
4. 新規デッキの場合は `README.md` のデッキ一覧にも追記する

## 構成と規約

- テーマは `themes/mamansoft.css` が唯一の正。**デッキに CSS をコピーしない**
- デッキ固有の primary 色は `index.md` 冒頭の `<style>:root { --color-primary: ... }</style>` で上書き
- 新フォーマットが必要なら、デッキ内 `<style scoped>` で済ませず、汎用性があるものは
  テーマに追加して `docs/format-catalog.md` と `format-samples/` も更新する
- 画像は各デッキの `resources/` に置き、`resources/xxx.png` の相対パスで参照
- `index.html` はコミット対象。PDF / pptx / `.preview/` はコミットしない(.gitignore 済み)
- スライド・ドキュメントは日本語
- コミットメッセージは `<type>: <説明>`(feat / fix / refactor / docs / chore)

## Marp の落とし穴(必読)

- **`<div>` 内に Markdown を書くときは、開始タグの後と終了タグの前に空行が必要。**
  空行がないと Markdown がパースされず生テキストになる:

  ```markdown
  <div class="right">

  - この空行がないと箇条書きにならない

  </div>
  ```

- ページ全体のフォーマット指定はスライド先頭の `<!-- _class: ... -->`(`_class` は
  そのスライドのみ、`class` だと以降全部に効く)
- スライド区切りは `---`(前後に空行)。front-matter の `---` と混同しない
- `![bg left:40%](...)` などの背景画像構文は 1 スライド 1 回。通常画像は `![center](...)` 等の alt 指定
- **`index.html` は再ビルドのたびに `data-marpit-scope-*` ハッシュだけ変わる。**
  内容に変更がないのに index.html だけ差分が出た場合はノイズなので `git checkout` で破棄してよい
- Tailwind はランタイム CDN(オンライン時のみ有効)。レイアウトの土台はテーマ CSS の
  クラスで組み、Tailwind は微調整(余白・文字サイズ)に留める
