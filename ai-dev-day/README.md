# template

スライドテンプレート用のプロジェクト。

## 起動

```bash
marp -s . --html
```

## スライド作成のヒント

### カラーテーマ

https://hue360.herokuapp.com/

### Nerd Font

`style.css` で以下を追加。

```css
@import "https://www.nerdfonts.com/assets/css/webfont.css";
```

スライドには `nf` と `nf-...` クラスを指定。

```html
<i class="nf nf-cod-github"></i>
```

### SVGアイコン

1. #000 のSVGアイコンをダウンロード
2. [css-color-filter-generator](https://angel-rs.github.io/css-color-filter-generator/) を使ってfilterを作成
3. 2のfilterをカスタムプロパティとして定義

## ビルド

### HTML

```bash
marp index.md --html --theme style.css
```

### PDF

```bash
marp index.md --html --theme style.css --pdf --allow-local-files
```

### pptx

```bash
marp index.md --html --theme style.css --pptx --allow-local-files
```
