# slides リポジトリ整理・テンプレートエコシステム実装計画

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Marp スライドリポジトリに共通テーマ・テンプレート・作成スクリプト・CLAUDE.md を整備し、フォーマットを必要十分に整理する。

**Architecture:** テーマ CSS を `themes/mamansoft.css` に一元化し(未使用フォーマット削除 + `.item` 追加)、`.marprc.yml` の themeSet で全デッキから参照。`template/` + `new-slide.sh` + `Makefile` で新規デッキ作成とビルドを 1 コマンド化。既存 3 デッキはデッキ内 `style.css` を削除して移行。

**Tech Stack:** Marp CLI(導入済み: `~/.nix-profile/bin/marp`)、POSIX shell、Make

## Global Constraints

- スライド・ドキュメントは日本語で書く
- ビルド成果物 `index.html` はコミット対象(gitignore しない)
- Tailwind CDN 依存は維持する
- デッキの primary 色: ai-dev-day `#ff6362` / intro-novakey `#457EF7` / raycast-meet-up-1 `#3db680`
- 作業ディレクトリ: `/Users/sijis/ghq/github.com/n-seiji/slides`
- コミットメッセージは `<type>: <説明>` 形式(feat/fix/refactor/docs/chore)

---

### Task 1: 共通テーマ `themes/mamansoft.css` と `.marprc.yml`

**Files:**
- Create: `themes/mamansoft.css`(`ai-dev-day/style.css` ベース)
- Create: `.marprc.yml`
- Create: `.gitignore`

**Interfaces:**
- Produces: テーマ名 `mamansoft`(各デッキ front-matter の `theme: mamansoft` が参照)、CSS クラス `.item`

- [ ] **Step 1: テーマファイルをコピー**

```bash
mkdir -p themes
cp ai-dev-day/style.css themes/mamansoft.css
```

- [ ] **Step 2: 未使用フォーマットを削除**

削除前に未使用を再確認:

```bash
grep -rn "text-dimmed-background\|tag-note\|headless-table\|grid-cross\|grid-col-div-3" */index.md
```

Expected: 出力なし(exit 1)。出力があった場合、そのクラスは削除しない。

`themes/mamansoft.css` から以下の 5 ブロックを Edit で削除する(コメント行ごと):

1. `/* 暗転背景にテキスト */` から始まる `section.text-dimmed-background * { ... }`
2. `/* ヘッダなしテーブル */` から始まる `section.headless-table table thead th { ... }`
3. `/* 画面右上に補足 */` から始まる `section .tag-note { ... }`
4. `section.grid-cross { ... }` とその子孫セレクタ群(`section.grid-cross h2` / `.leftup` / `.rightup` / `.leftdown` / `.rightdown`)
5. `section .grid-col-div-3 { ... }`

- [ ] **Step 3: `.item` クラスを追加**

`themes/mamansoft.css` の `section .label {` ブロックの直前に追加:

```css
/* 自己紹介などの行レイアウト(ラベル + テキスト) */
section .item {
  display: flex;
  align-items: center;
  gap: 0.75em;
}
```

- [ ] **Step 4: `.marprc.yml` を作成**

```yaml
html: true
themeSet: ./themes
```

- [ ] **Step 5: `.gitignore` を作成**

```gitignore
# ビルド一時成果物(index.html はコミット対象のため除外しない)
*.pdf
*.pptx
.DS_Store
```

- [ ] **Step 6: テーマが解決できることを確認**

```bash
marp ai-dev-day/index.md -o /tmp/theme-check.html && grep -c "mamansoft" /tmp/theme-check.html
```

Expected: exit 0(この時点ではデッキ内 style.css が残っているが、themeSet と重複してもエラーにならないこと。警告が出た場合は Task 4 のデッキ移行後に再確認)

- [ ] **Step 7: Commit**

```bash
git add themes/mamansoft.css .marprc.yml .gitignore
git commit -m "feat: 共通テーマ themes/mamansoft.css と marp 設定を追加"
```

### Task 2: `template/` ディレクトリ

**Files:**
- Create: `template/index.md`
- Create: `template/README.md`
- Create: `template/resources/.gitkeep`

**Interfaces:**
- Consumes: テーマ `mamansoft`、クラス `slide-title` / `chapter-divider` / `slide-last` / `.item` / `.label`
- Produces: プレースホルダ `{{TITLE}}` / `{{DATE}}` / `{{COLOR}}`(Task 3 の new-slide.sh が置換)

- [ ] **Step 1: `template/index.md` を作成**

````markdown
---
theme: mamansoft
_class: lead
paginate: true
---

<script src="https://cdn.tailwindcss.com/3.4.4"></script>
<script>tailwind.config = { corePlugins: { preflight: false } }</script>

<style>
:root {
  --color-primary: {{COLOR}};
}
</style>

<!-- _class: slide-title -->

<div class="title">
  <div>{{TITLE}}</div>
</div>

<div class="date-and-event">{{DATE}}</div>

---

![bg height:400px left:40%](https://avatars.githubusercontent.com/u/49780855?s=400&u=5558932d8ba727cab68badcf07551ef75e9a2c76&v=4)

<div>
  <h1 class="text-foreground">
    せいじ
    <small class="text-3xl font-bold">(Seiji Nakayama)</small>
  </h1>
  <h5 class="text-dimmed">x (@se_eiji)</h5>
  <div class="mt-12 space-y-2 text-2xl">
    <div class="item">
      <div class="label">業務</div>
      <span><small>バックエンド・Webの開発(たまにアプリ)</small></span>
    </div>
    <div class="item">
      <div class="label">エディタ</div>
      <span>Neovim(intellijも使う)</span>
    </div>
    <div class="item">
      <div class="label">好き</div>
      <span>
        Raycast・Vim・ロードバイク・車<br />
        <strong>シンプルで拡張性があるプロダクト</strong>
      </span>
    </div>
    <div class="item">
      <div class="label">サイト</div>
      <a href="https://sijis.me"><small>HomePage</small></a>
      <a href="https://www.raycast.com/n_seiji"><small>Raycast</small></a>
      <a href="https://github.com/n-seiji"><small>GitHub</small></a>
    </div>
  </div>
</div>

---

<!-- _class: chapter-divider -->

<div class="left">
  <h2>アジェンダ</h2>
</div>
<div class="right">

1. **セクション 1**
2. セクション 2
3. セクション 3

</div>

---

## セクション 1

- 本文はここに書く
- 2 カラムが必要なら `grid-5-5` / `grid-2-8`、要素内カラムは `grid-col-*`
- フォーマット一覧: `docs/format-catalog.md`

---

<!-- _class: slide-last -->

# ご清聴ありがとうございました
````

- [ ] **Step 2: `template/README.md` を作成**

```markdown
# {{TITLE}}

- イベント:
- 日付: {{DATE}}
- 発表 URL:

## ビルド

リポジトリルートで:

​```bash
make html DECK=<このディレクトリ名>
​```
```

(注: コードフェンスのエスケープ `​``` ` は実ファイルでは通常の ``` にする)

- [ ] **Step 3: resources ディレクトリ**

```bash
mkdir -p template/resources && touch template/resources/.gitkeep
```

- [ ] **Step 4: テンプレートがビルドできることを確認**

```bash
marp template/index.md -o /tmp/template-check.html
```

Expected: exit 0

- [ ] **Step 5: Commit**

```bash
git add template/
git commit -m "feat: 新規デッキ用テンプレートを追加"
```

### Task 3: `new-slide.sh` と `Makefile`

**Files:**
- Create: `new-slide.sh`(実行権限付与)
- Create: `Makefile`

**Interfaces:**
- Consumes: `template/` と `{{TITLE}}` / `{{DATE}}` / `{{COLOR}}` プレースホルダ
- Produces: `./new-slide.sh <name> [color]`、`make new NAME=x [COLOR=y]`、`make html|pdf|pptx DECK=x`、`make serve`

- [ ] **Step 1: `new-slide.sh` を作成**

```bash
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
```

```bash
chmod +x new-slide.sh
```

- [ ] **Step 2: `Makefile` を作成**

```makefile
MARP := marp

.PHONY: new serve html pdf pptx check-deck

# 新規デッキ作成: make new NAME=my-talk [COLOR="#ff6362"]
new:
ifndef NAME
	$(error NAME を指定してください: make new NAME=my-talk [COLOR="\#ff6362"])
endif
	./new-slide.sh "$(NAME)" $(if $(COLOR),"$(COLOR)")

# 全体プレビューサーバ
serve:
	$(MARP) -s .

check-deck:
ifndef DECK
	$(error DECK を指定してください: make html DECK=my-talk)
endif

# ビルド: make html|pdf|pptx DECK=my-talk
html: check-deck
	$(MARP) "$(DECK)/index.md" -o "$(DECK)/index.html"

pdf: check-deck
	$(MARP) "$(DECK)/index.md" --pdf --allow-local-files -o "$(DECK)/index.pdf"

pptx: check-deck
	$(MARP) "$(DECK)/index.md" --pptx --allow-local-files -o "$(DECK)/index.pptx"
```

- [ ] **Step 3: 動作確認(作成 → ビルド → 掃除)**

```bash
./new-slide.sh test-deck "#123456"
grep -c "test-deck\|#123456" test-deck/index.md   # プレースホルダ置換を確認
test ! -f test-deck/index.md.bak
make html DECK=test-deck
test -f test-deck/index.html
./new-slide.sh test-deck 2>&1 | grep "既に存在"    # 衝突エラーを確認
rm -rf test-deck
```

Expected: 全て exit 0、grep は 2 以上のカウント

- [ ] **Step 4: Commit**

```bash
git add new-slide.sh Makefile
git commit -m "feat: デッキ作成スクリプトと Makefile を追加"
```

### Task 4: 既存 3 デッキの移行

**Files:**
- Modify: `ai-dev-day/index.md`, `intro-novakey/index.md`, `raycast-meet-up-1/index.md`(色上書き `<style>` 追加)
- Delete: `ai-dev-day/style.css`, `intro-novakey/style.css`, `raycast-meet-up-1/style.css`
- Modify: 各デッキの `README.md`(デッキ固有情報に置換)
- Modify: 各デッキの `index.html`(再ビルド)

**Interfaces:**
- Consumes: `themes/mamansoft.css`、`.marprc.yml`(themeSet)

- [ ] **Step 1: 各デッキに色上書きを追加**

各 `index.md` の Tailwind `<script>` 行の直後に追加(色はデッキごと):

```html
<style>
:root {
  --color-primary: #ff6362; /* intro-novakey: #457EF7 / raycast-meet-up-1: #3db680 */
}
</style>
```

- [ ] **Step 2: デッキ内 style.css を削除**

```bash
git rm ai-dev-day/style.css intro-novakey/style.css raycast-meet-up-1/style.css
```

- [ ] **Step 3: 再ビルドして色が維持されることを確認**

```bash
make html DECK=ai-dev-day && make html DECK=intro-novakey && make html DECK=raycast-meet-up-1
grep -c "ff6362" ai-dev-day/index.html
grep -c "457EF7\|457ef7" intro-novakey/index.html
grep -c "3db680" raycast-meet-up-1/index.html
```

Expected: 各 grep が 1 以上

- [ ] **Step 4: 各デッキ README をデッキ固有情報に置換**

`ai-dev-day/README.md`:

```markdown
# MCPを利用するインターフェースとしてのRaycastのポテンシャル

- イベント: AI dev day
- 日付: 2025/06/01

## ビルド

リポジトリルートで `make html DECK=ai-dev-day`
```

`intro-novakey/README.md` と `raycast-meet-up-1/README.md` も同様に、各 `index.md` の表紙スライドからタイトル・日付を転記して作成する。

- [ ] **Step 5: Commit**

```bash
git add -A ai-dev-day intro-novakey raycast-meet-up-1
git commit -m "refactor: 既存デッキを共通テーマ参照に移行"
```

### Task 5: ドキュメント(CLAUDE.md / README.md / format-catalog.md)

**Files:**
- Create: `CLAUDE.md`
- Modify: `README.md`(ルート)
- Create: `docs/format-catalog.md`

**Interfaces:**
- Consumes: Task 1〜4 の成果(themes/、template/、new-slide.sh、Makefile)

- [ ] **Step 1: `docs/format-catalog.md` を作成**

`themes/mamansoft.css` の最終状態を確認しながら、以下の構成で全フォーマットを文書化する。各項目は「用途 1 行 + Markdown スニペット」:

```markdown
# スライドフォーマットカタログ

テーマ `themes/mamansoft.css` で使えるフォーマットの一覧。

## ページ全体(front-matter の `_class` や `<!-- _class: ... -->` で指定)

### slide-title — 表紙
### lead — 中央寄せリード
### chapter-divider — 章区切り(左タイトル + 右アジェンダ)
### full + lead + narration-white — 全面画像 + 白文字ナレーション
### slide-last — 最終スライド
### grid-5-5 / grid-2-8 — セクション全体の 2 カラム

## 要素内レイアウト(div の class で指定)

### grid-col-2-8 / grid-col-3-7 / grid-col-4-6 / grid-col-5-5 — 行内 2 カラム
### center — 中央寄せ
### item + label — 自己紹介などのラベル付き行

## 装飾

### note — 小さい補足テキスト
### 画像 alt: center / full / foreground / primary / secondary
### blockquote / テーブル / コード(自動適用)

## 色ユーティリティ

### text-foreground / text-primary / text-secondary / text-dimmed / text-ghost / bg-primary
```

各セクションに実際に使う Markdown/HTML スニペットを必ず添える(既存デッキの `index.md` から実例を抜粋してよい)。

- [ ] **Step 2: ルート `README.md` を書き換え**

```markdown
# slides

Marp 製のスライド置き場。1 ディレクトリ = 1 発表。

## 新規デッキ作成

​```bash
make new NAME=my-talk COLOR="#ff6362"   # COLOR 省略可
​```

## プレビュー / ビルド

​```bash
make serve                # 全体プレビュー (marp -s .)
make html DECK=my-talk    # index.html 生成(コミット対象)
make pdf DECK=my-talk
make pptx DECK=my-talk
​```

## 構成

- `themes/mamansoft.css` — 共通テーマ(唯一の正)。デッキ側の色は index.md 内で `--color-primary` を上書き
- `template/` — 新規デッキの雛形
- `docs/format-catalog.md` — 使えるスライドフォーマット一覧

## スライド作成のヒント

(旧デッキ README にあった Nerd Font / SVG アイコン / カラーテーマのヒントをここへ移す)
```

- [ ] **Step 3: `CLAUDE.md` を作成**

```markdown
# CLAUDE.md

Marp 製スライドのリポジトリ。1 ディレクトリ = 1 発表デッキ。

## コマンド

- 新規デッキ: `make new NAME=<name> COLOR="#xxxxxx"`(内部で `new-slide.sh` を実行)
- プレビュー: `make serve`
- ビルド: `make html DECK=<name>` / `make pdf DECK=<name>` / `make pptx DECK=<name>`

## 構成と規約

- テーマは `themes/mamansoft.css` が唯一の正。**デッキに CSS をコピーしない**
- デッキ固有の primary 色は `index.md` 冒頭の `<style>:root { --color-primary: ... }</style>` で上書き
- 使えるフォーマットは `docs/format-catalog.md` を参照。新フォーマットが必要なら
  デッキ内 `<style scoped>` ではなく、汎用性があるものはテーマに追加してカタログも更新する
- 画像は各デッキの `resources/` に置く
- `index.html` はコミット対象。`index.md` を編集したら `make html DECK=<name>` で再生成してからコミット
- PDF / pptx はコミットしない(.gitignore 済み)
- スライド・ドキュメントは日本語

## 新しいデッキを作るとき

1. `make new NAME=<name>` で作成
2. `index.md` の表紙タイトル・日付・アジェンダを編集
3. `make serve` で確認しながら執筆
4. `make html DECK=<name>` で index.html を生成してコミット
```

- [ ] **Step 4: Commit**

```bash
git add CLAUDE.md README.md docs/format-catalog.md
git commit -m "docs: CLAUDE.md・README・フォーマットカタログを整備"
```

### Task 6: 最終検証

**Files:** なし(検証のみ)

- [ ] **Step 1: 全デッキ + テンプレートのビルド確認**

```bash
for d in ai-dev-day intro-novakey raycast-meet-up-1; do make html DECK=$d || exit 1; done
marp template/index.md -o /tmp/template-final.html
```

Expected: 全て exit 0

- [ ] **Step 2: 削除フォーマットの残存チェック**

```bash
grep -rn "text-dimmed-background\|tag-note\|headless-table\|grid-cross\|grid-col-div-3" */index.md themes/ template/ docs/format-catalog.md
```

Expected: 出力なし

- [ ] **Step 3: new-slide.sh のスモークテスト(再)**

```bash
./new-slide.sh smoke-test && make html DECK=smoke-test && rm -rf smoke-test
git status --short   # smoke-test の残骸がないこと
```

- [ ] **Step 4: 差分の再ビルドが残っていれば commit**

```bash
git status --short
# 差分があれば: git add -A && git commit -m "chore: 最終ビルド反映"
```
