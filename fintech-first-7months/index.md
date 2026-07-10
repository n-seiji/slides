---
theme: mamansoft
title: Fintechは地続きだった
_class: lead
paginate: true
---

<script src="https://cdn.tailwindcss.com/3.4.4"></script>
<script>tailwind.config = { corePlugins: { preflight: false } }</script>

<style>
:root {
  --color-primary: #61ccbe;
  /* 白背景バリアント(戻すときはこの4行と narration-white の上書きを消す) */
  --color-foreground: #3b3a36;
  --color-background: #f6f3ec;
  --color-ghost: #9a988f;
}
section.narration-white > p {
  color: #3b3a36;
}
</style>

<!-- _class: slide-title -->

<div class="title">
  <div>Fintechは地続きだった</div>
</div>
<div class="name">Seiji Nakayama</div>
<div class="date-and-event">2026/07/13 Welcome Fintech #6 夏の大トーク大会</div>

---

<!-- _class: full lead narration-white -->

# Welcome Fintech #6

# 夏の大トーク大会ーーー！！！

<!-- タイトルコール。全力で読み上げる -->

---

<!-- _class: full lead narration-white -->

皆さん、夏ですね！

---

<!-- _class: full lead narration-white -->

夏といえば、、、？

---

<!-- _class: full lead narration-white -->

# 海！

---

<!-- _class: full lead narration-white -->

# 海といえば、青！

---

<!-- _class: full lead -->

<style scoped>
section { background: #61ccbe; }
section h1 { color: #fff; }
</style>

# 青といえば、miive！

---

## miive！

<div class="flex justify-center items-center">
  <img class="h-[500px]" src="./resources/miive-card.png">
</div>

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
  <h5 class="text-dimmed">x (@se_eiji)</h5>
  <div class="mt-12 space-y-2 text-2xl">
    <div class="item">
      <div class="label">所属</div>
      <span>株式会社miive</span>
    </div>
    <div class="item">
      <div class="label">業界歴</div>
      <span>フィンテック <strong>7ヶ月</strong></span>
    </div>
    <div class="item">
      <div class="label">業務</div>
      <span><small>バックエンド・Web・アプリ開発</small></span>
    </div>
    <div class="item">
      <div class="label">好き</div>
      <span>
        Raycast・Vim・ロードバイク<br />
        <strong>シンプルで拡張性があるプロダクト</strong>
      </span>
    </div>
    <div class="item">
      <div class="label">特徴</div>
      <span>実家が洋菓子店</span>
    </div>
    <div class="item">
      <div class="label">会社の特徴</div>
      <span>金曜日は「よい週末を！」って言う</span>
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

## 経歴

2025/11 より前は、ナビゲーションの会社にいました。

- 物流系のサービス開発
- 新規事業の 0→1 開発
- 地図の配信システム開発、SRE
- 一瞬 POS システムの開発にも

詳しくは => [sijis.me](https://sijis.me)

---

<!-- _class: full lead narration-white -->

<!-- 改めてのタイトルコール -->

# 「Fintechは地続きだった」

---

## 遡ること2年前、#welcome_fintech に参加

<div class="flex justify-center items-center">
  <img class="h-[460px]" src="./resources/welcome-fintech-3.jpeg">
</div>

---

## 当時の Fintech のイメージ

- COBOL とか使ってるんでしょ？
- セキュリティめっちゃ厳しくて <u>**Raycast 使えなそう**</u>
- 強強エンジニアが集まっている場所
- **一見さんお断り**
- むずい。複雑。

---

<!-- _class: full lead narration-white -->

# 要するに、海の向こうの世界

###### (夏だけに)

---

## そこから

転職を考え始め、SmartBank さんのカジュアル面談などもお願いした。

からの、色々あって今の会社 **miive** に。

---

## miive は福利厚生カードを作っています

- **BtoBtoC** のサービス
- 管理者(企業側)が制度をつくる
- 従業員はアプリで確認 & <u>**カードで支払う**</u>ことで福利厚生を使える

---

## ex. ピってやったら半額、会社から補助がでる

<div class="flex justify-center items-center gap-8 mt-8">
  <img class="h-[420px]" src="./resources/miive-card.png">
  <div class="text-6xl font-bold" style="color: var(--color-primary);">→</div>
  <img class="h-[420px]" src="./resources/conbini-pay.jpeg">
</div>

---

## 入社してからやってたこと

1〜5ヶ月目は、**サービス開発**、**問い合わせの調査**。

<!-- TODO: ギュッと略歴を載せる(オンボ→管理者画面→チーム再編 など1行ずつ) -->

ここ2ヶ月で、<u>**決済に関わる部分**</u>にも手を入れ始めた。

---

<!-- _class: full lead narration-white -->

# 決済、めっちゃたのしい

---

## 楽しいポイント 1: 思ったよりもゆるい

決済は、Visa のネットワークから送られてくる情報を元に処理する。

で、その<u>**送られてくるデータが案外適当**</u>。

- 決済日が正確でない
- 返金なのに<u>**元の取引が特定できない**</u>

それを受け止める設計を考えるのが**面白い**(辛いけど)。

---

## 楽しいポイント 2: 日々発見しかない

知らない仕様がたくさん出てきて**おもろい**。発見がある。

<u>**「普段の支払いの裏でこんなことおきてたのか〜」と思いを馳せる。**</u>

Visa の他にも ISMS や PCI DSS など、色々な基準がある。**むずい & おもろい**。

---

## 楽しいポイント 3: 縛りがある中での実装

顧客の要望や実現したい機能と、サービスの制約。

どう<u>**落としどころ**</u>をつけるか？

---

## 自分はこんなことをやってた

- 曜日や時間帯で**決済を制限**
- **上限金額**を設定

簡単に見えるが、<u>**落とし穴だらけ**</u>。

---

## 実装前の認識

- オーソリ(店舗で支払った瞬間に飛んでくる、利用予定の通知)が来た時の情報で判断すればいいんでしょ？**秒じゃん。**

<div class="text-center text-5xl font-bold mt-6 mb-6" style="color: var(--color-primary);">↓ 実際</div>

- オーソリだけじゃない、<u>**クリアリングでも判断が必要**</u>
- クリアリング時には**決済した日時が入ってない場合もある**！？
- **追加徴収**のクリアリングが来た場合 & 元取引が見つからなかったらどうする？
- 顧客 & ビジネスサイドに**どう説明する**？

---

## ＋自社サービスならではの複雑さ

お店で**決済をするタイミング**と、決済を経て制度の利用申請を出して**補助が確定するタイミング**がある。

それぞれで<u>**残高や残ポイントの変動**</u>が発生。

**2倍ややこしい。**

---

## 当時のイメージ、答え合わせ

| 当時のイメージ                 | 7ヶ月経った現実                          |
| ------------------------------ | ---------------------------------------- |
| COBOL とか使ってるんでしょ？   | **1行も書いてません**                    |
| Raycast 使えなそう             | **バリバリ使えてます**                   |
| 強強エンジニアの集まり         | 強い人はいる。でも**みんなやさしい**     |
| 一見さんお断り                 | むしろ **Welcome** でした(このイベント名) |
| むずい。複雑。                 | ほんとにむずい。でも、**たのしい**       |

---

<!-- _class: full lead narration-white -->

ただ、俯瞰してみると、、、

---

<!-- _class: full lead narration-white -->

# やってること、あんま変わらない

---

## 本当にやってることはおんなじ

<style scoped>
.flow { display: flex; justify-content: center; align-items: center; gap: 0.6em; margin-top: 1.2em; }
.flow .step {
  border: 3px solid var(--color-primary);
  border-radius: 0.5em;
  padding: 0.6em 0.4em;
  width: 8.5em;
  font-size: 1.15em;
  white-space: nowrap;
  font-weight: bold;
  text-align: center;
  line-height: 1.3;
}
.flow .step small { display: block; font-size: 0.5em; font-weight: normal; opacity: 0.8; white-space: nowrap; }
.flow .arrow { color: var(--color-primary); font-size: 1.6em; font-weight: bold; }
.goal {
  text-align: center;
  margin-top: 1.2em;
  font-size: 1.15em;
}
</style>

<div class="goal">

**顧客にいいものを届ける。ユーザーが使いやすいようにする。**

</div>

<div class="flow">
  <div class="step">考える<small>要望・制約の落としどころ</small></div>
  <div class="arrow">→</div>
  <div class="step">作る<small>設計・実装</small></div>
  <div class="arrow">→</div>
  <div class="step">デリバリーする<small>ユーザーに届ける</small></div>
</div>

<div class="note">※ なにかあったときの責任は重い(お金なので)。</div>

---

<!-- _class: full lead narration-white -->

海の向こうだと思ってた Fintech、、、

<div class="flex justify-center items-center">
  <img class="h-[400px]" src="./resources/sea-far.svg">
</div>

---

<!-- _class: full lead narration-white -->

# そう、Fintechは地続きだった

<div class="flex justify-center items-center">
  <img class="h-[380px]" src="./resources/land-connected.svg">
</div>

###### 泳がなくても、歩いて来られました

---

<!-- _class: slide-last -->

# welcome_fintech

ご清聴ありがとうございました

みなさん、よい夏を！🌊
