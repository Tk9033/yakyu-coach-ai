# README

# yakyu-coach-ai

![Yakyu Coach トップ画像](app/assets/images/ogp.png)

## 目次
* [サービス概要](#サービス概要)
* [サービスURL](#サービスurl)
* [サービス開発の背景](#サービス開発の背景)
* [機能紹介](#機能紹介)
* [技術構成について](#技術構成について)
    * [使用技術](#使用技術)
    * [ER図](#er図)
    * [画面遷移図](#画面遷移図)


## サービス概要
野球中継の専門用語についていけなかったり、子どもの試合で何が起きているのか分からない人のためのアプリです。
「あの走るやつ」「ダブルなんとか」など曖昧な検索でも、AIがあなたの理解度に合わせて、野球以外の例えや観戦ポイントを交えて分かりやすく解説します。
調べるだけでその場で理解でき、恥ずかしくて聞けない疑問もすぐに解決できます。

## サービスURL
https://yakyucoach.com/

## サービス開発の背景
高校時代、野球部の保護者会に父が参加しましたが、周りは野球経験者や指導者ばかりで、野球のルールしか分からない父は戦術や専門用語の話についていけず、あまり会話に参加できなかったみたいです。当時は「仕方ない」と思っていましたが、自分が社会人になり野球未経験者と話す中で、野球に興味はあるのに理解できず楽しめない人が多いと気づきました。

野球観戦は好きだけど、詳しい話はわからない人、子どもが野球を始めて、もっと理解したいと思っている保護者、野球に興味はあるけど、どこから学べばいいかわからない人でも理解度に合わせて学べるアプリがあれば、もっと野球を楽しめるのではと思い、開発を決めました。

## 機能紹介

[![Image from Gyazo](https://i.gyazo.com/83ff22fc85d7d7b8d11e2c85b8c7295d.gif)](https://gyazo.com/83ff22fc85d7d7b8d11e2c85b8c7295d)

[![Image from Gyazo](https://i.gyazo.com/139cc4a1fb16fd31aedf9c8b1475ef40.gif)](https://gyazo.com/139cc4a1fb16fd31aedf9c8b1475ef40)


## 使用する技術スタック
- Ruby on Rails 7.1.5 / Ruby 3.2.6
- JavaScript
- Tailwind CSS / DaisyUI
- Render（デプロイ）
- OpenAI API
- PostgreSQL
- Docker

## 画面遷移図
- [画面遷移図（Figma）](https://www.figma.com/design/8WVZxTzZAwlwzfKY0MoGwV/無題?node-id=0-1&t=YxwhpswlSKCxnMPF-1)

## ER図
![ER図](https://i.gyazo.com/8be550529b123fa2e5f12f7367b511e4.png)