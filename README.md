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
| birthday         | date       | null: false               |
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