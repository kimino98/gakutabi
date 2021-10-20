# アプリ概要
### アプリケーション名 

<img src="https://user-images.githubusercontent.com/82023221/119596521-4d492b00-be1a-11eb-994e-38dd27bd804b.png" width="200px">
 

### 概要

 **教育旅行**（修学旅行・遠足、ゼミ合宿)に特化した投稿サービスです。<br>
学校の先生や教育旅行担当の旅行会社、業者の方が投稿し合う事によって、学校行事に必要な情報だけを得る事ができ、より良い遠足や修学旅行を計画することできます。<br>
実際教育旅行で行った地域を教員の目線でレビューします。<br>
また旅行のプロとしての意見を旅行会社が投稿し、現地の最新情報を観光施設の方が伝える事ができます。<br>
行き先に悩んでいる先生は検索機能で候補の地域をすぐに検索できるので候補決め作業を素早く行えます。<br>

<br>

市場分析も含めたスライドを作成しましたのでご参照下さい(https://docs.google.com/presentation/d/1iYUxGW1AYfudC75bWHxQhs3iWQV7-vmraths-l8WEC0/edit?usp=sharing)<br>
<br>
# 本番環境URL

https://www.gakutabi.site/

<Basic認証><br>
username: ynwa<br>
password: 1898

# 開発背景

前職では旅行会社で学校営業の担当となり、修学旅行の企画提案を従事して参りました。<br>
そこであったらいいなと思っていたサービスを形にしました<br>
旅行投稿系サービスは多くあります。<br>
しかし、教育旅行で知りたい口コミはほとんどありません。<br>
一般旅行と教育旅行で知りたい情報を表しました。<br>
<br>

 **一般旅行と教育旅行の知りたい情報の違い**
|項目| 一般旅行 | 教育旅行 |
| -- | -- | -- |
| 部屋 | 景色(海側？山側?) | フロア別貸切ができるか |
| 食事 | ビュッフェ？部屋食？<br>お肉料理？魚料理？ | アレルギー対応ができるか |
| 値段 | 1泊2食など<br>一般のお客様の料金は平等 | 学生料金<br>全館貸切や一校一館などで料金が変わる |
| その他 | 周辺の観光地について | 学習要素(ただ楽しいだけではだめ) |
<br>

このような違いがあります。<br>
教育旅行の情報を得るには教育旅行担当の旅行会社に聞くか、先生同士の交流で聞くしかありません。<br>また昨今、修学旅行の行き先はほとんど変わらない状況です。<br>

|2019年度実施の国内修学旅行の実態まとめ(中学生)<抜粋>|
|---|
|[![Image from Gyazo](https://i.gyazo.com/cda73ecafb816d40a5ce68ceb8197eed.png)](https://gyazo.com/cda73ecafb816d40a5ce68ceb8197eed)|

>参考: 公益財団法人 日本修学旅行協会 https://jstb.or.jp/publics/index/48/

<br>

 **このグラフから考えられる事** 
 * 教育旅行をする候補地を知らない
 * 他地域に変える事でまた一から作らないといけない為、時間がかかる
 * 学校の伝統があるから変えられない
 * これ以上ない地域だと思っている

以上の事から"ガクタビ"(本サービス)で、実際に行った事がある教員や旅行のプロが投稿し合う事でより良い行事ができる事に貢献したいと思い、作成しました。

# 工夫した点

### 開発行程
* ペルソナに該当する前職の旅行会社の社員やお世話になった先生に企画の趣旨を伝えて,ご教授を頂きながら作成しました。

* 意見を伺って、コロナ禍でどの施設がどんなコロナ対策をしているかを調べるのが大変だったという事を知り、実施に機能を取り入れました。(投稿機能内のコロナ対策項目)

* 実際の開発現場を想定して、機能ごとに細かくブランチを切って開発を進めました

# 機能一覧

* ユーザー登録、ログイン機能(devise)
* ゲストログイン機能
* ユーザ編集機能(自己紹介文、プロフィール画像変更)
* マイページ機能(自らした投稿一覧・いいねした投稿一覧)
* 投稿機能
  * 複数枚画像投稿機能
  * 画像プレビュー機能
  * 文字数カウント機能(Ajax)
  *  カテゴリー項目 (ActibeHash)
* 投稿編集機能
* 投稿削除機能
* スライドショー機能(Slick)
* いいね機能(Ajax)
  * いいね数表示機能
  * 自己いいね一覧機能
* コメント機能
  * コメント数表示機能
* ページネーション機能(kaminari)
* パンくずリスト機能(gretel)
* 検索機能(ransack)
* レスポンシブ機能(ハンバーガーメニュー)

<br>

# 機能一部紹介

### ユーザー登録機能

### ユーザーマイページ機能

### 投稿機能

### 検索機能

<br>

# 今後実装したいの機能

# 使用技術
* Ruby 2.6.5
* Ruby on Rails 6.0.0
* MySQL 5.6
* Nginx
* AWS
  * VPC
  * EC2
  * RDS
  * Route53
  * ALB
  * ACM
* Capistrano3
* RSpec

#  テスト
- RSpec
  - 単体テスト(model)
  - 統合テスト(system)

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