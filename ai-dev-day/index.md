---
theme: mamansoft
_class: lead
paginate: true
---

<script src="https://cdn.tailwindcss.com/3.4.4"></script>
<script>tailwind.config = { corePlugins: { preflight: false } }</script>

<!-- _class: slide-title -->

<div class="title">
  <div>[WIP]MCPを利用するインターフェースとしてのRaycastのポテンシャル</div>
</div>

<div class="date-and-event">2024/03/21 </div>

---

![bg height:400px left:40%](https://avatars.githubusercontent.com/u/49780855?s=400&u=5558932d8ba727cab68badcf07551ef75e9a2c76&v=4)

<style scoped>
.item {
  display: flex;
  align-items: center;
  gap: 0.75em;
}
</style>

<div>
  <h1 class="text-foreground">
    せいじ
    <small class="text-3xl font-bold">(Seiji Nakayama)</small>
  </h1>
  <h5 class="text-dimmed">ただのVimmer</h5>
  <div class="mt-12 space-y-2 text-2xl">
    <div class="item">
      <div class="label">業務</div>
      <span><small>バックエンド・Webの開発（たまにアプリ）</small></span>
    </div>
    <div class="item">
      <div class="label">言語</div>
      <span><small>業務 => Go, TypeScript, Kotlin, Flutter<br /> 趣味=> Haskell, Rust, Lua</small></span>
    </div>
    <div class="item">
      <div class="label">エディタ</div>
      <span>Neovim(intellijも使う)</span>
    </div>
    <div class="item">
      <div class="label">好き</div>
      <span>
        Vim・ロードバイク・車<br />
        <strong>シンプルで拡張性があるプロダクト</strong>
      </span>
    </div>
    <div class="item">
      <div class="label">特徴</div>
      <span>実家が洋菓子店</span>
    </div>
    <div class="item">
      <div class="label">デバイス</div>
      <span><small>Apple / EIZO / HHKB Studio</small></span>
    </div>
    <div class="item">
      <div class="label">サイト</div>
      <a href="https://sijis.me"><small>HomePage</small></a>
      <a href="https://www.raycast.com/n_seiji"><small>Raycast</small></a>
      <a href="https://github.com/n-seiji"><small>GitHub</small></a>
      <a href="https://x.com/se_eiji">
        X
      </a>
    </div>
  </div>
</div>

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. Raycastとは？
2. Raycast MCP
3. Raycast AI Extensions
4. Raycast AI ExtensionsとRaycast MCPを組み合わせる
5. AI Extensionsの作り方
6. 終わりに

</div>

---

<!-- _class: full lead narration-white -->

# Raycastとは？

---

## Raycastの概要

- macOS用のランチャーアプリケーション
- キーボードショートカットで素早く操作可能
- 豊富な拡張機能（Extensions）
- カスタマイズ可能なワークフロー
- 開発者フレンドリーな設計

---

## Raycastの主な機能

- アプリケーションの起動
- ファイル検索
- クリップボード履歴
- システムコマンドの実行
- カスタムスクリプトの実行
- 拡張機能による機能拡張

---

## Raycastの特徴

- 高速な起動と検索
- キーボード中心の操作
- 美しいUI/UX
- 豊富なカスタマイズ性
- アクティブな開発者コミュニティ

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~Raycastとは？~~
2. **Raycast MCP**
3. Raycast AI Extensions
4. Raycast AI ExtensionsとRaycast MCPを組み合わせる
5. AI Extensionsの作り方
6. 終わりに

</div>

---

<!-- _class: full lead narration-white -->

# Raycast MCP

---

## Raycast MCPの設定方法

- Raycastの設定からMCPを有効化
- APIキーの設定
- モデルの選択
- プロンプトのカスタマイズ

---

## Raycast MCPの詳細設定

- モデル選択
  - GPT-4
  - GPT-3.5
  - Claude
  - その他のモデル
- プロンプトテンプレート
  - システムプロンプト
  - ユーザープロンプト
  - コンテキスト設定

---

## Raycast MCPの使い方

- ショートカットキーでMCPを起動
- テキスト選択時のコンテキストメニュー
- カスタムプロンプトの実行
- 結果のコピーや編集

---

## MCPの活用例

- コードの説明生成
- ドキュメントの要約
- テキストの翻訳
- アイデアの展開
- 質問応答

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~Raycastとは？~~
2. ~~Raycast MCP~~
3. **Raycast AI Extensions**
4. Raycast AI ExtensionsとRaycast MCPを組み合わせる
5. AI Extensionsの作り方
6. 終わりに

</div>

---

<!-- _class: full lead narration-white -->

# Raycast AI Extensions

---

## Raycast AI Extensionsの機能

- カスタムAIコマンドの作成
- プロンプトテンプレートの管理
- 複数のAIモデルの統合
- ワークフローの自動化

---

## AI Extensionsの種類

- テキスト処理系
  - 要約
  - 翻訳
  - 文章生成
- コード系
  - コード生成
  - コードレビュー
  - バグ修正
- 画像系
  - 画像生成
  - 画像分析
  - 画像編集

---

## 人気のAI Extensions

- AI Chat
- AI Writer
- AI Code
- AI Image
- AI Translator

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~Raycastとは？~~
2. ~~Raycast MCP~~
3. ~~Raycast AI Extensions~~
4. **Raycast AI ExtensionsとRaycast MCPを組み合わせる**
5. AI Extensionsの作り方
6. 終わりに

</div>

---

<!-- _class: full lead narration-white -->

# Raycast AI ExtensionsとRaycast MCPを組み合わせる

---

## YouTube動画の要約機能

- URLから動画情報の取得
- MCPを使用した要約の生成
- 結果の整形と保存
- カスタムコマンドとしての実装

---

## 実装例：YouTube要約機能

```typescript
import { getPreferenceValues } from "@raycast/api";
import { youtube_v3 } from "googleapis";

export default async function Command() {
  const { apiKey } = getPreferenceValues();
  const youtube = new youtube_v3.Youtube({ auth: apiKey });
  
  // 動画情報の取得
  const videoId = "VIDEO_ID";
  const video = await youtube.videos.list({
    part: ["snippet", "contentDetails"],
    id: [videoId],
  });

  // MCPを使用して要約を生成
  const summary = await generateSummary(video.data);
  
  return {
    title: "動画要約",
    content: summary,
  };
}
```

---

## その他の組み合わせ例

- コードレビュー自動化
- ドキュメント生成
- 画像分析と説明生成
- 多言語翻訳ワークフロー

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~Raycastとは？~~
2. ~~Raycast MCP~~
3. ~~Raycast AI Extensions~~
4. ~~Raycast AI ExtensionsとRaycast MCPを組み合わせる~~
5. **AI Extensionsの作り方**
6. 終わりに

</div>

---

<!-- _class: full lead narration-white -->

# AI Extensionsの作り方

---

## AI Extensionsの開発手順

1. 開発環境のセットアップ
2. プロジェクトの作成
3. APIの実装
4. UIの設計
5. テストとデバッグ
6. パッケージングと配布

---

## 開発環境のセットアップ

```bash
# Raycast CLIのインストール
npm install -g @raycast/api

# プロジェクトの作成
raycast create my-ai-extension

# 開発サーバーの起動
raycast dev
```

---

## 基本的なExtensionの構造

```typescript
import { ActionPanel, Action, List } from "@raycast/api";

export default function Command() {
  return (
    <List>
      <List.Item
        title="AI機能"
        actions={
          <ActionPanel>
            <Action
              title="実行"
              onAction={() => {
                // AI処理の実装
              }}
            />
          </ActionPanel>
        }
      />
    </List>
  );
}
```

---

## デバッグとテスト

- Raycastの開発者ツール
- コンソールログの確認
- エラーハンドリング
- ユニットテスト
- E2Eテスト

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~Raycastとは？~~
2. ~~Raycast MCP~~
3. ~~Raycast AI Extensions~~
4. ~~Raycast AI ExtensionsとRaycast MCPを組み合わせる~~
5. ~~AI Extensionsの作り方~~
6. **終わりに**

</div>

---

<!-- _class: full lead narration-white -->

# ご清聴ありがとうございました！

<div class="mt-8">
  <p>質問・フィードバックをお待ちしています</p>
</div>

---

## 参考リンク

- [Raycast公式サイト](https://www.raycast.com)
- [Raycast APIドキュメント](https://developers.raycast.com)
- [Raycast GitHub](https://github.com/raycast/extensions)
- [Raycastコミュニティ](https://raycast.com/community)
