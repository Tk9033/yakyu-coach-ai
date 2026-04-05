# README

# yakyu-coach-ai

![Yakyu Coach トップ画像](app/assets/images/ogp.png)

## 目次
-  [サービス概要](#サービス概要)
-  [サービスURL](#サービスurl)
-  [サービス開発の背景](#サービス開発の背景)
-  [機能紹介](#機能紹介)
-  [技術構成について](#技術構成について)
    -  [使用技術](#使用技術)
    -  [ER図](#er図)
    -  [画面遷移図](#画面遷移図)

<br><br>

# サービス概要
野球中継の専門用語についていけなかったり、子どもの試合で何が起きているのか分からない人のためのアプリです。
「あの走るやつ」「ダブルなんとか」など曖昧な検索でも、AIがユーザーの理解度（初心者〜上級者）に合わせて、野球以外の例えや観戦ポイントを交えて分かりやすく解説します。
調べるだけでその場で理解でき、恥ずかしくて聞けない疑問もすぐに解決できます。
<br>

## サービスURL
https://yakyucoach.com/

<br><br>

# サービス開発の背景
高校時代、野球部の保護者会に父が参加しましたが、周りは野球経験者や指導者ばかりで、野球のルールしか分からない父は戦術や専門用語の話についていけず、あまり会話に参加できなかったみたいです。当時は「仕方ない」と思っていましたが、自分が社会人になり野球未経験者と話す中で、野球に興味はあるのに理解できず楽しめない人が多いと気づきました。

野球観戦は好きだけど、詳しい話はわからない人、子どもが野球を始めて、もっと理解したいと思っている保護者、野球に興味はあるけど、どこから学べばいいかわからない人でも理解度に合わせて学べるアプリがあれば、もっと野球を楽しめるのではと思い、開発を決めました。

<br><br>

# 機能紹介

<div style="text-align: center;">
  <h3>1. トップページ</h3>
  <img src="https://i.gyazo.com/984c27205a6bfd7c6f5c4f94530f313b.gif)" width="80%">
  <div style="width: 80%; text-align: left; margin: 15px auto 0; line-height: 1.6;">
    トップページの「使ってみる」ボタンからゲストログインを行い、理解度選択画面へ進みます。 <br> アカウント登録なしで、すぐにアプリを体験することができます。
  </div>
</div>

<br><br>
<hr>
<br>

<div style="text-align: center;">
  <h3>2. ユーザー理解度選択</h3>
  <img src="https://i.gyazo.com/c637487280d906a2320ac44d116419eb.gif" width="80%">
  <div style="width: 80%; text-align: left; margin: 15px auto 0; line-height: 1.6;">
    理解度選択画面では、今、自分が野球用語について、どれくらい理解しているかを選択することができます。<br>初心者から中級者、上級者まで選ぶことができ、選択後に「検索画面へ進む」で検索ページへ遷移します。また、理解度は右上のドロップダウンメニューの「理解度選択」から変更することができます。
  </div>
</div>

<br><br>
<hr>
<br>

<div style="text-align: center;">
  <h3>3. 検索機能</h3>
  <img src="https://i.gyazo.com/b617f14f7553304a007836f463725648.gif" width="80%">
  <hr style="width: 80%; margin: 20px 0; border: 0; border-top: 1px solid #eee;">
  <img src="https://i.gyazo.com/9005f7bab310a478c699839a1089eb17.gif" width="80%">
  <div style="width: 80%; text-align: left; margin: 15px auto 0; line-height: 1.6;">
    検索フォームに用語を入力すると、AIがユーザーの理解度に合わせて解説文を生成します。<br>
    解説文は右上のブックマークボタン（⭐︎）で保存可能です。<br><br>
    ※上の2つの動画はどちらも「ヒット」と検索していますが、理解度設定（初心者・中級者）によってAIの回答内容が変化されている様子を確認できます。
  </div>
</div>

<br><br>
<hr>
<br>

<div style="text-align: center;">
  <h3>4. ブックマーク機能</h3>
  <img src="https://i.gyazo.com/4206c11a7d6bbf074a26c3175d4143f2.gif" width="80%">
  <div style="width: 80%; text-align: left; margin: 15px auto 0; line-height: 1.6;">
    メニューの「ブックマーク」から保存済みの一覧ページへ遷移します。<br>
    一覧からリンクをクリックすることで、過去に生成した解説文をいつでも再確認できます。
  </div>
</div>

<br><br>

# 技術構成

## 使用技術


| カテゴリ | 技術内容 |
| --- | --- |
| サーバーサイド | Ruby on Rails 7.1.5 Ruby 3.2.6 |
| フロントエンド | Ruby on Rails・JavaScript |
| CSSフレームワーク | Tailwindcss |
| Web API | OpenAI API |
| データベース | PostgreSQL |
| デプロイ | Render |
| 環境構築 | Docker |

## 画面遷移図
- [画面遷移図（Figma）](https://www.figma.com/design/8WVZxTzZAwlwzfKY0MoGwV/無題?node-id=0-1&t=YxwhpswlSKCxnMPF-1)

## ER図
![ER図](https://i.gyazo.com/6b3c3e24895aa4f466e652e8477a8935.png)