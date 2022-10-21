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
ユーザー登録することでペット登録、ポスト、コメント投稿できるようになります。（ユーザー登録していない人でも投稿しているペット、コメント、ポストを見ることができます。。）マイページで特定のユーザーがつぶやいたペットやポスト一覧を取得する。

2.ペット登録機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）

3.ペットの情報編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

4.ペット削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。

５.ポスト投稿機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）

６.ポスト編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

7.ポスト削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。

8.コメント機能
商品詳細ページでコメントを投稿すると、リロードすることなくコメントが反映される。別のブラウザで同じ商品を開いていた場合も、リロードすることなくコメントが反映される"。

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

# clone

% git clone  https://github.com/RogerSi666/Chuha.git <br>
% cd furima-38008 <br>
% bundle install <br>
% rails db:create <br>
% rails db:migrate