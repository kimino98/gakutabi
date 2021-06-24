# README
# アプリケーション名 

<img src="https://user-images.githubusercontent.com/82023221/119596521-4d492b00-be1a-11eb-994e-38dd27bd804b.png" width="200px">
 

# アプリケーション概要

 教育旅行（修学旅行や遠足に特化したwebアプリケーションです。
 
 実際教育旅行で行った地域を教員の目線でレビューします。
 
 教員だけではなく、教育旅行営業担当の旅行会社や宿泊施設、観光地の方の教育旅行目線の投稿もできます。


# 背景

教育旅行は一般の旅行とは旅行をする上で大事にしている視点が違います。

* 宿泊施設のアレルギー対応
* 学習要素
* 貸切対応の人数         
など...

このような情報は一般のお客様向けの旅行レビューサイトでは分からない事だと思いました。

また、他の学校がどんな所へ行き、どんな学習をしているかが気になると思いました。

そこでこちらのアプリケーションを作成しました。


# URL
 
 作成中

# テスト用アカウント

 作成中

# 利用方法

 作成中

# 目指した課題解決

教員ならではの目線での旅行レビューアプリなので行き先の候補地探しの時、

このアプリを見ていただければすぐに知りたい情報を知る事ができます。

また、教員の業務が一つ減り、業務改善に繋がり、生徒にとってはより良い学習体験ができて一生の思い出を作ることができます。

# 洗い出した要件



# 実装した機能についての画像やGIFおよびその説明

 作成中


# 実装予定の機能
* ユーザ管理機能 利用するユーザーを把握するため
* 投稿機能 
* 検索機能 知りたい情報をすぐに入手するため
* コメント機能 投稿を見たユーザーがもっと情報を知りたいと思った時に質問で切るようにするため


# DB設計

# users

| Column             |  Type   | Options      |
| ------------------ | ------  | -----------  | 
| nickname           | string  | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| company_name       | string  | null: false  |
| profession_id      | integer | null: false  |

## Association
- has_many :reviews
- has_many :reviews_comments




# reviews

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| name             | string     | null: false       |
| hotel_type_id    | integer    | null; false       |
| grade_id         | integer    | null: false       | 
| season_id        | integer    | null: false       |
| region_id        | integer    | null: false       |
| count_id         | integer    | null: false       |
| price            | integer    |                   |
| text             | text       | null: false       |
| safety           | text       | null: false       |
| user             | references | foreign_key: true |

## Association
belongs_to :user
has_many   :reviews_comments








# reviews_comments

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| user             | references | foreign_key: true |
| review           | references | foreign_key: true | 

## Association
belongs_to :user
belongs_to :review



# likes

# ローカルでの動作方法

 作成中