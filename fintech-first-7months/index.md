---
theme: mamansoft
title: Fintech ｺﾜｸﾅｲﾖ
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
  <div>Fintech ｺﾜｸﾅｲﾖ</div>
</div>
<div class="name">Seiji Nakayama</div>
<div class="date-and-event">2026/07/13 Welcome Fintech #6 夏の大トーク大会</div>

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
      <div class="label">会社の特徴</div>
      <span>金曜日は「よい週末を！」って言う</span>
    </div>
    <div class="item">
      <div class="label">業界歴</div>
      <span><strong>7ヶ月</strong></span>
    </div>
    <div class="item">
      <div class="label">業務</div>
      <span><small>バックエンド・Web・アプリ開発</small></span>
    </div>
    <div class="item">
      <div class="label">性格</div>
      <span>好奇心旺盛</span>
    </div>
    <div class="item">
      <div class="label">苦手なもの</div>
      <span>おばけ</span>
    </div>
    <div class="item">
      <div class="label">好き</div>
      <span>Raycast・Vim・ロードバイク</span>
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

## 経歴(色々やってる)

2025/11 より前は、ナビゲーションの会社にいました。

- 物流系のサービス開発
- サッカーに関する新規事業の 0→1 開発
- 地図の配信システム開発
- SRE
- 一瞬 POS システムの開発にも

詳しくは => [sijis.me](https://sijis.me)

---

## イベントとかも好き

**[Raycast Community Japan](https://devx.jp/rct)** の運営もしてたりしてます。

<div class="flex justify-center items-center mt-6">
  <img class="h-[420px]" src="./resources/raycast-community-japan.jpeg">
</div>

---

## 余談: 今日も日中、別のイベントに参加してました

<div class="grid-col-5-5 mt-8">
<div>

<div class="flex justify-center items-center">
  <img class="h-[400px]" src="./resources/pmm-conf.png">
</div>

</div>
<div class="mt-10">

**PMM JAPAN CONFERENCE 2026**

守屋さんのお話、めっちゃ面白かったです。

<u>**LayerXのどなたか。<br>守屋さんをご紹介いただきたいです mm**</u>

</div>
</div>

---

## 遡ること2年前、#welcome_fintech に参加

<div class="flex justify-center items-center mt-10">
  <img class="h-[440px]" src="./resources/welcome-fintech-3.jpeg">
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

イベントを通して

# 「もしかしたら、こわくないかも」

ってなった

---

<!-- _class: full lead narration-white -->

<style scoped>
section { padding-bottom: 3em; }
</style>

###### 今日話すこと

# 実際に入ってみて<br>Fintechって怖くなかった

---

<!-- _class: full lead narration-white -->

改めて、<span style="color: var(--color-primary); font-weight: bold;">miive</span> の中山です。

---

## miive は福利厚生カードを作っています

- **BtoBtoC** のサービス
- 管理者(企業側)が制度をつくる
- 従業員はアプリで確認 & <u>**カードで支払う**</u>ことで福利厚生を使える

簡単にいうと<strong>「今の福利厚生、使いづらいから使いやすくしようぜ！」</strong>というサービス。

<div class="flex justify-center items-center mt-4">
  <img class="h-[280px]" src="./resources/miive-card.png">
</div>

---

## ポイントとマネー

会社から付与される<strong>「ポイント」</strong>と、ユーザー自身がチャージする<strong>「マネー」</strong>がある。

ポイントが使えるお店で「ピッ」ってすると、

例えば、<u>**半分はポイントから、半分はマネーから引かれる**</u>。

<div class="flex justify-center items-center gap-8 mt-4">
  <img class="h-[230px]" src="./resources/miive-card.png">
  <div class="text-5xl font-bold" style="color: var(--color-primary);">→</div>
  <img class="h-[230px]" src="./resources/conbini-pay.jpeg">
</div>

---

## 入社してからやってたこと(私の場合)

- **web やアプリが中心のサービス開発**
- **顧客からの問い合わせ対応** 
<br>→ <u>**少しずつ決済に触れる**</u>。

決済をしっかり触ったのは、**ここ2ヶ月ぐらい**。

---

<!-- _class: full lead narration-white -->

# 決済、めっちゃたのしい

---

## 楽しいポイント 0: 前提、意味がわからない概念が登場する

| 概念             | ざっくり言うと                                             |
| ---------------- | ---------------------------------------------------------- |
| オーソリ         | 店舗で支払った瞬間に飛んでくる「利用予定」の通知(与信枠の確保) |
| クリアリング     | 後日届く「売上確定」の情報。ここで金額が変わることも       |
| リコンサイル     | 記録同士を突き合わせて、ズレがないか確認する作業           |
| イシュア         | カードを発行する側。miive はここ                           |
| アクワイアラ     | 加盟店(お店)を管理する側                                   |
| チャージバック   | 不正利用などで、決済を取り消してお金を取り返す仕組み       |

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

## ここ2ヶ月、自分はこんなことやってた

- 曜日や時間帯で**決済を制限**
  - 会社が意図した時間外での決済では、ポイントが使えなくなる
- **ポイント利用上限**を設定
  - 一回の決済で使えるポイントの上限金額を制限する(一気にポイントを使い切らないように)

簡単に見えるが、<u>**落とし穴だらけ**</u>。

---

## 「曜日や時間帯で決済を制限」機能の場合

実装前:「オーソリが来た時の情報で判断すればいいんでしょ？**秒じゃん。**」

<div class="text-center text-4xl font-bold mt-4 mb-4" style="color: var(--color-primary);">↓ 実際</div>

- オーソリだけじゃない、<u>**クリアリングでも判断が必要**</u>。

- **決済した日時が入ってない**クリアリングもある！？

- **追加徴収** & 元取引が見つからない場合、どうする？

- オーソリ、クリアリングの場合の仕様を、顧客・ビジネスサイドに**どう説明する**？

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

決済、やっぱり怖いかもしれない、、、むずい。。。

###### お金なにかあったら怖い。。。

---

<!-- _class: full lead narration-white -->

ただ、俯瞰してみると...

---

<!-- _class: full lead narration-white -->

# やってること、あんま変わらない

---

## 極論、通常のサービス開発

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
  <div class="step">考える<small>課題深堀り<br>要望・制約の落としどころ</small></div>
  <div class="arrow">→</div>
  <div class="step">作る<small>設計・実装</small></div>
  <div class="arrow">→</div>
  <div class="step">デリバリーする<small>ユーザーに届ける</small></div>
</div>

<div class="note">※ なにかあったときの責任は重い(お金なので)。</div>

---

## シミュラクラ現象

<style scoped>
.simulacra { display: flex; justify-content: center; align-items: center; gap: 3em; margin-top: 1.2em; }
.face {
  width: 5.5em; height: 5.5em;
  border: 3px solid var(--color-foreground);
  border-radius: 0.6em;
  display: grid;
  place-items: center;
}
.dots { display: grid; grid-template-columns: 1fr 1fr; gap: 0.9em 1.6em; }
.dots span { width: 0.75em; height: 0.75em; background: var(--color-foreground); border-radius: 50%; }
.dots span:last-child { grid-column: 1 / 3; justify-self: center; }
.caption { text-align: center; margin-top: 0.8em; }
</style>

点が3つ集まると、人は勝手に<strong>「顔」</strong>として認識してしまう。

<div class="simulacra">
  <div class="face">
    <div class="dots"><span></span><span></span><span></span></div>
  </div>
  <div class="text-5xl font-bold" style="color: var(--color-primary);">=</div>
  <div class="text-6xl">😱</div>
</div>

<div class="caption">

正体を知らないものを、人は<u>**勝手に怖いものとして見てしまう**</u>。

</div>

---

<!-- _class: full lead narration-white -->

# 知ると、Fintech ｺﾜｸﾅｲﾖ

---

<!-- _class: slide-last -->

# welcome_fintech

ご清聴ありがとうございました

みなさん、よい夏を！👻
