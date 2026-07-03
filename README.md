# slides

Marp 製のスライド置き場。1 ディレクトリ = 1 発表。

## 新規デッキ作成

```bash
make new NAME=my-talk COLOR="#ff6362"   # COLOR 省略可(デフォルト #ff6362)
# または ./new-slide.sh my-talk "#ff6362"
```

## プレビュー / ビルド

```bash
make serve                # 全体プレビュー (marp -s .)
make html DECK=my-talk    # index.html 生成(コミット対象)
make pdf DECK=my-talk     # PDF 生成(コミットしない)
make pptx DECK=my-talk    # pptx 生成(コミットしない)
```

## 構成

- `themes/mamansoft.css` — 共通テーマ(唯一の正)。デッキ固有の色は `index.md` 内で `--color-primary` を上書き
- `template/` — 新規デッキの雛形(`new-slide.sh` がコピーして placeholder を置換)
- `docs/format-catalog.md` — 使えるスライドフォーマットの一覧
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
