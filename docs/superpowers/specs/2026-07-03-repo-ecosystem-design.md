# slides リポジトリ整理・テンプレートエコシステム設計

日付: 2026-07-03
状態: ユーザーレビュー待ち(質問への応答がなかったため、推奨案を前提として採用)

## 背景 / 現状

- Marp 製スライド 3 デッキ(`ai-dev-day` / `intro-novakey` / `raycast-meet-up-1`)
- 各デッキが `index.md` / `style.css` / `README.md` / `resources/` / ビルド済み `index.html` を持つ
- 3 つの `style.css` は `--color-primary` の 1 行を除き完全に同一(531 行 × 3 の重複)
- 各デッキの `README.md` は全て同一のテンプレート説明(デッキ固有情報なし)
- テンプレートディレクトリが存在せず、既存デッキのコピーで新規作成している
- テーマに定義済みだが全デッキ未使用のフォーマットが多数ある一方、
  自己紹介スライドの行レイアウト(`.item`)は各デッキで scoped style として重複定義されている

## 前提(採用した判断)

ユーザーへの確認質問に応答がなかったため、以下の推奨案を採用する。
変更希望があれば本設計を修正する。

1. テーマ CSS は `themes/` に一元化し、既存 3 デッキも移行する
2. 新規デッキ作成はシェルスクリプト、ビルドコマンドは Makefile に集約
3. ビルド成果物 `index.html` はコミット継続(GitHub 上で閲覧可能な状態を維持)
4. Tailwind CDN 依存は維持
5. フォーマットは「未使用の削除」と「不足の追加」の両方を行う

## ゴール

1. `CLAUDE.md` を作成し、Claude が迷わず作業できるようにする
2. テンプレートを 1 コマンドでコピーして新規デッキを作れるようにする
3. テーマ CSS を一元化し、重複を排除する
4. スライドフォーマットを必要十分なカタログに整理し、文書化する

## 設計

### ディレクトリ構成(After)

```
slides/
├── CLAUDE.md             # Claude 向け: 構成・コマンド・規約・カタログへの参照
├── README.md             # 人間向け: 新規作成手順・ビルド手順
├── Makefile              # make new NAME=xxx COLOR=... / make html|pdf|pptx DECK=xxx / make serve
├── new-slide.sh          # template/ をコピーし、タイトル・日付・primary 色を置換
├── .marprc.yml           # themeSet: themes / html: true
├── .gitignore            # PDF/pptx 等の一時成果物(index.html は除外しない)
├── themes/
│   └── mamansoft.css     # 共通テーマ(唯一の正・整理済み)
├── template/
│   ├── index.md          # 雛形: 表紙 / 自己紹介 / 章区切り / 本文例 / 最終スライド
│   ├── README.md         # デッキ固有メモの雛形(発表イベント・日付・配布 URL 等)
│   └── resources/.gitkeep
├── docs/
│   ├── format-catalog.md # 全フォーマット一覧 + md スニペット
│   └── superpowers/specs/
├── ai-dev-day/           # style.css 削除、共通テーマ + 色上書きへ移行
├── intro-novakey/
└── raycast-meet-up-1/
```

### テーマ一元化

- `themes/mamansoft.css` を唯一の正とする(`ai-dev-day/style.css` をベースに整理)
- `.marprc.yml` の `themeSet` で読み込み、各デッキの front-matter は現行どおり `theme: mamansoft`
- デッキ固有の primary 色は `index.md` 冒頭の `<style>:root { --color-primary: #xxxxxx; }</style>` で上書き
  - ai-dev-day: `#ff6362` / intro-novakey: `#457EF7` / raycast-meet-up-1: `#3db680`
- 各デッキの `style.css` は削除

### フォーマットカタログ(必要十分)

維持:
- `slide-title`(表紙)/ `slide-last`(最終)/ `chapter-divider`(章区切り)
- `lead` / `full` / `narration-white`(画像全面 + ナレーション)
- `grid-5-5` / `grid-2-8`(セクション 2 カラム)
- `grid-col-2-8` / `grid-col-3-7` / `grid-col-4-6` / `grid-col-5-5`(要素内カラム)
- `center` / `note` / `label` / 画像 alt(`center` / `full` / `foreground` / `primary` / `secondary`)
- blockquote / テーブル装飾 / コード装飾

追加(不足の解消):
- `.item`: 自己紹介スライドの行レイアウト(現在は各デッキで scoped style 重複)をテーマへ昇格
- 自己紹介スライドの定型をテンプレート `index.md` に含める

削除(過剰・全デッキ未使用):
- `text-dimmed-background` / `tag-note` / `headless-table` / `grid-cross` / `grid-col-div-3`
- 削除前に全デッキ `index.md` を grep して未使用を再確認する

### 新規デッキ作成フロー

```bash
make new NAME=my-talk COLOR="#ff6362"   # または ./new-slide.sh my-talk "#ff6362"
```

- `template/` を `./my-talk/` にコピー
- `index.md` のプレースホルダ(`{{TITLE}}` / `{{DATE}}` / `{{COLOR}}`)を置換
  - DATE は実行日、COLOR 未指定時はデフォルト色
- 既存ディレクトリがある場合はエラー終了(上書きしない)

### ビルド

```bash
make serve                 # marp -s . (リポジトリ全体をプレビュー)
make html DECK=my-talk     # index.html 生成
make pdf DECK=my-talk      # PDF 生成
make pptx DECK=my-talk     # pptx 生成
```

### CLAUDE.md の内容

- リポジトリの目的と構成
- 新規デッキ作成・ビルドのコマンド
- テーマは `themes/mamansoft.css` が唯一の正であること、デッキ側で CSS をコピーしないこと
- フォーマットカタログ(`docs/format-catalog.md`)への参照
- 規約: スライドは日本語 / 画像は各デッキの `resources/` / `index.html` はコミットする

### 移行と検証

1. テーマ整理・テンプレート整備・スクリプト作成
2. 既存 3 デッキから `style.css` を削除し、色上書き `<style>` を `index.md` に追加
3. `marp` で 3 デッキを再ビルドし、見た目の劣化がないことを確認(削除フォーマットの誤使用がないことも grep で確認)
4. 各デッキの `README.md` はデッキ固有情報(イベント名・日付)のみ残す形に置換
   (テンプレート説明はルート README / docs へ移動)

### エラーハンドリング

- `new-slide.sh`: 引数不足・既存ディレクトリ衝突・置換失敗時に非 0 終了で明確なメッセージ
- Makefile: `DECK` 未指定時はエラーメッセージを表示

### テスト

- `./new-slide.sh test-deck` → 生成物の構造・置換結果を確認して削除
- 3 デッキ + template のビルドが警告なく通ること
- 削除した CSS クラスが全 `index.md` に出現しないこと(grep)

## スコープ外

- スライド内容そのものの編集
- CI(GitHub Actions での自動ビルド)— 必要なら別タスク
- Tailwind の置換・削除
