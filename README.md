# slides

Marp 製のスライド置き場。1 ディレクトリ = 1 発表。

公開ページ: https://n-seiji.github.io/slides/(main ブランチのルートを GitHub Pages で配信。
トップページは `mise run index` で生成)

## デッキ一覧

| デッキ | タイトル | イベント / 日付 |
|--------|---------|----------------|
| [raycast-meet-up-1](raycast-meet-up-1/) | Raycastを育てよう！ | Raycast Meetup Japan #1 / 2025/02/21 |
| [ai-dev-day](ai-dev-day/) | MCPを利用するインターフェースとしてのRaycastのポテンシャル | AI dev day / 2025/06/01 |
| [intro-novakey](intro-novakey/) | novakey: 開発者募集 | novakey 紹介 / 2024/03/21 |
| [fintech-first-7months](fintech-first-7months/) | Fintech怖くないよ | Welcome Fintech #6 / 2026/07/13 |
| [format-samples](format-samples/) | ページパターン見本集(コピペ用) | — |

## セットアップ

タスクランナーは [mise](https://mise.jdx.dev/) を使う(要: `marp` CLI)。初回のみ:

```bash
mise trust
```

## 新規デッキ作成

```bash
mise run new my-talk "#ff6362"   # 色は省略可(デフォルト #ff6362)
```

## プレビュー / ビルド

```bash
mise run serve             # 全体プレビュー (marp -s .)
mise run check             # 全デッキがビルドできるか確認
mise run html my-talk      # index.html 生成(コミット対象)
mise run preview my-talk   # スライドを 1 枚ずつ PNG 出力(my-talk/.preview/)
mise run pdf my-talk       # PDF 生成(コミットしない)
mise run pptx my-talk      # pptx 生成(コミットしない)
```

## 構成

- `themes/mamansoft.css` — 共通テーマ(唯一の正)。デッキ固有の色は `index.md` 内で `--color-primary` を上書き
- `template/` — 新規デッキの雛形(`new-slide.sh` がコピーして placeholder を置換)
- `format-samples/` — ページパターンの見本集(1 スライド = 1 パターン、コピペ用)
- `docs/format-catalog.md` — 使えるスライドフォーマット(CSS クラス)の一覧
- `<デッキ名>/` — 各発表。`index.md`(原稿)/ `index.html`(ビルド成果物)/ `resources/`(画像)

## スライド作成のヒント

### カラーテーマ

https://hue360.herokuapp.com/

### Nerd Font

テーマ側で必要になったら `themes/mamansoft.css` に以下を追加。

```css
@import "https://www.nerdfonts.com/assets/css/webfont.css";
```

スライドには `nf` と `nf-...` クラスを指定。

```html
<i class="nf nf-cod-github"></i>
```

### SVG アイコン

1. #000 の SVG アイコンをダウンロード
2. [css-color-filter-generator](https://angel-rs.github.io/css-color-filter-generator/) で filter を作成
3. filter をカスタムプロパティとして定義(`--color-filter-*` 参照)
