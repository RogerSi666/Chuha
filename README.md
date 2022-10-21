# README

## アプリケーション名

hachuha

## アプリケーション概要

飼っているペットの写真をシェアしながら、飼い主の工夫、悩み、楽しみについての情報をシェアして、ユーザー同士と会えるアプリケーション。

## URL

Herokuによるデプロイ
https://hachuha.herokuapp.com/

## テスト用アカウント

email: test@test.com
password: test1234

## 利用方法

新規登録してから、ご自身が飼っているペットを登録できます。飼い主としての自分の経験をポストでユーザー同士とシェアできます。ペットの写真一覧ページを見られます。好きになったペットの飼い主のポストに移遷できます。ポスト投稿、好きなポストに対してコメントを投稿して、他の飼い主に会えます。

## アプリケーションを作成した背景

自分、とても元気で散歩が好きなワンちゃんの飼い主として、「散歩の相手をできましたらいいな」と思っています。気軽に他の飼い主と合わせる場所を作成しようと思います。

## 要件定義シート

https://docs.google.com/spreadsheets/d/1li_0V2hM8GV6OnBsyFAyQgEaCmWhTJ626JmmyGsJptI/edit#gid=982722306

## 実装機能

1.ユーザー登録機能
ユーザー登録することでペット登録、ポスト、コメント投稿できるようになります。（ユーザー登録していない人でも投稿しているペット、コメント、ポストを見ることができます。）

[![Image from Gyazo](https://i.gyazo.com/cea5702b58dfb688d829ca4b70a9ae4d.gif)](https://gyazo.com/cea5702b58dfb688d829ca4b70a9ae4d)
[![Image from Gyazo](https://i.gyazo.com/58dc367782758933e8b96b8d43e052d8.gif)](https://gyazo.com/58dc367782758933e8b96b8d43e052d8)

2.マイページ機能
マイページで特定のユーザーがつぶやいたペットやポスト一覧を取得する。

[![Image from Gyazo](https://i.gyazo.com/66951038bce60142b6b15da7a5b53a87.gif)](https://gyazo.com/66951038bce60142b6b15da7a5b53a87)

23.ペット登録機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）

[![Image from Gyazo](https://i.gyazo.com/9b380887ba00bb0e12d1715d71271acc.gif)](https://gyazo.com/9b380887ba00bb0e12d1715d71271acc)

4.ペットの情報編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

https://gyazo.com/d7d29d4c8da58a7973bbb161075882f9

5.ペット削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。

[![Image from Gyazo](https://i.gyazo.com/91da8f45a69d4fb788211b56ffa64a6d.gif)](https://gyazo.com/91da8f45a69d4fb788211b56ffa64a6d)

6.ポスト投稿機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）

[![Image from Gyazo](https://i.gyazo.com/cd3e0a7ae65899ef53f8f40858ff4df6.gif)](https://gyazo.com/cd3e0a7ae65899ef53f8f40858ff4df6)
[![Image from Gyazo](https://i.gyazo.com/a19f54f47c56ddd75243d7c78193f012.gif)](https://gyazo.com/a19f54f47c56ddd75243d7c78193f012)


7.ポスト編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

[![Image from Gyazo](https://i.gyazo.com/5ffbc2f4285f4ece018895b31bff0809.gif)](https://gyazo.com/5ffbc2f4285f4ece018895b31bff0809)

8.ポスト削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。

[![Image from Gyazo](https://i.gyazo.com/ee151329551a3756b28b51f5cc095274.gif)](https://gyazo.com/ee151329551a3756b28b51f5cc095274)

9.コメント機能
商品詳細ページでコメントを投稿すると、リロードすることなくコメントが反映される。別のブラウザで同じ商品を開いていた場合も、リロードすることなくコメントが反映される"。

[![Image from Gyazo](https://i.gyazo.com/9cc3b94642bb9120617bd8dbe2b9c573.gif)](https://gyazo.com/9cc3b94642bb9120617bd8dbe2b9c573)

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |

### Association

- has_many :pets
- has_many :posts
- has_many :comments

## pets テーブル

| Column           | Type       | Options                        |
| ---------------- | ------     | -------------------------------|
| name             | string     | null: false                    |
| gender_id        | integer    | null: false                    |
| type             | string     | null: false                    |
| information      | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## posts テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| comment_text       | text       | null: false                    |


### Association

- belongs_to :user
- belongs_to :post

## 設計図

[![Image from Gyazo](https://i.gyazo.com/56658afa0b00a19cc82069ab7eafd18f.png)](https://gyazo.com/56658afa0b00a19cc82069ab7eafd18f)

## が名遷移図

[![Image from Gyazo](https://i.gyazo.com/aca17afe230748cda603a628e9e2d422.png)](https://gyazo.com/aca17afe230748cda603a628e9e2d422)

# clone

% git clone  https://github.com/RogerSi666/Chuha.git <br>
% cd furima-38008 <br>
% bundle install <br>
% rails db:create <br>
% rails db:migrate