---
theme: mamansoft
_class: lead
paginate: true
---

<script src="https://cdn.tailwindcss.com/3.4.4"></script>
<script>tailwind.config = { corePlugins: { preflight: false } }</script>

<!-- _class: slide-title -->

<div class="title">
  <div>novakey: 開発者募集</div>
</div>
<div class="subtitle">AIと共に、次世代の文字入力を創造する</div>

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

1. novakey とは？
2. 私が解決したい課題
3. 技術的な挑戦と魅力
4. 募集する仲間について

</div>

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. **novakey とは？**
2. 私が解決したい課題
3. 技術的な挑戦と魅力
4. 募集する仲間について

</div>

---

<!-- _class: full lead narration-white -->

# novakey とは？

---

## novakey の概要

- OS レベルで動作する AI 文字変換・補完サービス
- あらゆるアプリケーションで利用可能
- ユーザーによる AI モデル選択の自由
  - ローカル LLM 対応
  - クラウド LLM 対応

---

## 競合との違い

| 機能         | novakey  | 従来の IME | Cursor/Copilot |
| ------------ | -------- | ---------- | -------------- |
| 適用範囲     | 全アプリ | 全アプリ   | 特定アプリ     |
| AI モデル    | 自由選択 | 固定       | 固定           |
| ローカル LLM | 対応     | 非対応     | 非対応         |
| 入力方式     | 自由     | 固定       | 固定           |

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~novakey とは？~~
2. **私が解決したい課題**
3. 技術的な挑戦と魅力
4. 募集する仲間について

</div>

---

<!-- _class: full lead narration-white -->

# 私が解決したい課題

---

## 既存の文字入力の限界

1. 漢字変換の精度

   - 文脈を考慮した変換が難しい
   - スペースキーの連打が必要

2. 入力の非効率性

   - 目的の文字を探す時間
   - 変換候補の選択時間

3. AI の活用機会の損失
   - 日常的な文字入力で AI の恩恵を受けられない
   - ローカル LLM の活用機会が限定的

---

## novakey のビジョン

すべての人が、思考を妨げられることなく、
スムーズに情報伝達できる世界を実現する

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~novakey とは？~~
2. ~~私が解決したい課題~~
3. **技術的な挑戦と魅力**
4. 募集する仲間について

</div>

---

<!-- _class: full lead narration-white -->

# 技術的な挑戦と魅力

---

## アーキテクチャ

- OS レベルでの入力イベントフック
  - キーボードイベントの捕捉
  - アプリケーション間の連携
- AI 連携の仕組み
  - ローカル LLM との通信
  - クラウド LLM との通信
  - モデル切り替えの仕組み

---

## 使用予定/検討中の技術スタック

- 動けばなんでもいい

---

<!-- _class: chapter-divider -->

<div class="left">

### Agenda

</div>

<div class="right">

1. ~~novakey とは？~~
2. ~~私が解決したい課題~~
3. ~~技術的な挑戦と魅力~~
4. **募集する仲間について**

</div>

---

<!-- _class: full lead narration-white -->

# 募集する仲間について

---

## こんな方と一緒に開発したい

- OS の低レイヤー技術に興味がある方
- 同期的なコミュニケーションに抵抗がない方
- 思いついたことを形にできる方

---

## プロダクト作る上で大切にしていること

- シンプル
- 速い
- 拡張性がある

---

## 今後のマイルストーン

プロトタイプ完成 (2025/6)

---

<!-- _class: full lead narration-white -->

# 気になった方はお声がけください！
