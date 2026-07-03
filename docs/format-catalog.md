# スライドフォーマットカタログ

テーマ `themes/mamansoft.css` で使えるフォーマットの一覧。
新しいフォーマットを追加したら、このカタログにも必ず追記する。

> ページ単位の完成形サンプル(コピペ用・全 14 パターン)は `format-samples/` を参照。
> `make serve` で見た目を確認できる。

## ページ全体フォーマット

スライド単位で `<!-- _class: ... -->` を書いて適用する(front-matter の `_class` でも可)。

### slide-title — 表紙

```markdown
<!-- _class: slide-title -->

<div class="title">
  <div>発表タイトル</div>
</div>
<div class="name">Seiji Nakayama</div>
<div class="date-and-event">2025/06/01 イベント名</div>
```

`name` は省略可。primary 色の背景にタイトル・名前・日付を中央配置する。

### lead — 中央寄せリード

```markdown
<!-- _class: lead -->

## 言いたいことを大きく 1 つ
```

gaia テーマ由来。コンテンツを中央に寄せる。

### chapter-divider — 章区切り(左タイトル + 右アジェンダ)

```markdown
<!-- _class: chapter-divider -->

<div class="left">
  <h2>アジェンダ</h2>
</div>
<div class="right">

1. **いま話す章**(strong で強調表示)
2. 次の章
3. ~~話し終えた章~~(打ち消しでグレーアウト)

</div>
```

`ol` の項目は `**strong**` で強調、`~~打ち消し~~` でグレーアウトされる。

### full + lead + narration-white — 全面画像 + 白文字ナレーション

```markdown
<!-- _class: full lead narration-white -->

![bg](resources/photo.png)

画像の上に重ねる白文字のナレーション
```

### slide-last — 最終スライド

```markdown
<!-- _class: slide-last -->

# ご清聴ありがとうございました
```

### grid-5-5 / grid-2-8 — セクション全体の 2 カラム

```markdown
<!-- _class: grid-5-5 -->

## 見出し(header 領域)

<div class="left">
左カラム(50% / grid-2-8 なら 20%)
</div>
<div class="right">
右カラム(50% / grid-2-8 なら 80%)
</div>
```

## 要素内レイアウト

スライド内の `<div>` に class を付けて使う。

### grid-col-2-8 / grid-col-3-7 / grid-col-4-6 / grid-col-5-5 — 行内 2 カラム

```markdown
<div class="grid-col-3-7">
  <div>左(30%)</div>
  <div>右(70%)</div>
</div>
```

### center — 中央寄せ(flex)

```markdown
<div class="center">
  <img src="resources/figure.png" width="600" />
</div>
```

### item + label — ラベル付き行(自己紹介など)

```markdown
<div class="item">
  <div class="label">業務</div>
  <span>バックエンド・Webの開発</span>
</div>
```

## 装飾

### note — 小さい補足テキスト

```markdown
<div class="note">※ 補足やソースの明記に使う</div>
```

### 画像 alt 指定

```markdown
![center](resources/a.png)      <!-- 中央寄せ -->
![full](resources/a.png)        <!-- 幅 100% -->
![foreground](resources/a.svg)  <!-- 前景色に着色(黒 SVG 用 filter) -->
![primary](resources/a.svg)     <!-- primary 色に着色 -->
![secondary](resources/a.svg)   <!-- secondary 色に着色 -->
```

### blockquote — 引用(自動適用)

```markdown
> 引用文。末尾のリンクには「より引用」が自動で付く
> [ソース名](https://example.com)
```

### テーブル / コード / 箇条書き

Markdown をそのまま書けばテーマの装飾が自動適用される。

- `ul` は primary 色のドット、`ol` は primary 色の丸数字
- `*イタリック*`(em)は secondary 色の太字になる
- `~~打ち消し~~`(s)はグレーの通常文字になる(取り消し線は付かない)
- `` `inline code` `` は secondary 色

## 色ユーティリティ

```markdown
<span class="text-foreground">前景色</span>
<span class="text-primary">primary 色</span>
<span class="text-secondary">secondary 色</span>
<span class="text-dimmed">控えめ</span>
<span class="text-ghost">さらに控えめ</span>
<span class="bg-primary">primary 背景</span>
```

## デッキ固有の色

primary 色はデッキの `index.md` 冒頭で上書きする:

```html
<style>
:root {
  --color-primary: #ff6362;
}
</style>
```

## Tailwind

各デッキ冒頭で Tailwind CDN を読み込んでいるため、`flex` / `mt-12` / `text-2xl`
などのユーティリティも併用できる(オンライン環境でのみ有効)。
