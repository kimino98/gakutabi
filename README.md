# README

## users

| Column             |  Type  | Options      |
| ------------------ | ------ | -----------  | 
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| family_name        | string | null: false  |
| first_name         | string | null: false  |
| family_name_kana   | string | null: false  |
| first_name_kana    | string | null: false  |
| birth_day          | date   | null: false  |
| company_name       | string | null: false  |
| profession         | string | null: false  |

## Association
- has_many :hotels
- has_many :tourist_spots
- has_many :field_trip
- has_many :hotel_comments
- has_many :tourist_comments
- has_many :field_trip_comments



## hotels

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| name             | string     | null: false       |
| hotel_type_id    | integer    | null: false       |
| school_id        | integer    | null: false       | 
| season_id        | integer    | null: false       |
| profession_id    | integer    | null: false       |
| region_id        | integer    | null: false       |
| how_many_id      | integer    | null: false       |
| price            | integer    |                   |
| text             | text       | null: false       |
| user             | references | foreign_key: true |

## Association
belongs_to :user
has_many   :hotel_comments




## tourist_spots

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| name             | string     | null: false       |
| school_id        | integer    | null: false       | 
| season_id        | integer    | null: false       |
| profession_id    | integer    | null: false       |
| region_id        | integer    | null: false       |
| how_many_id      | integer    | null: false       |
| price            | integer    |                   |
| spot_genre       | string     |                   |
| text             | text       | null: false       |
| user             | references | foreign_key: true |

## Association
belongs_to :user
has_many :tourist_spot_comments




## field_trips

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| name             | string     | null: false       |
| school_id        | integer    | null: false       | 
| season_id        | integer    | null: false       |
| profession_id    | integer    | null: false       |
| region_id        | integer    | null: false       |
| how_many_id      | integer    | null: false       |
| price            | integer    |                   |
| genre            | string     |                   |
| text             | text       | null: false       |
| user             | references | foreign_key: true |

## Association
belongs_to :user
has_many :field_trip_comments




## hotel_comments

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| user             | references | foreign_key: true |
| hotel            | references | foreign_key: true | 

## Association
belongs_to :user
belongs_to :hotel



## tourist_spot_comments

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| user             | references | foreign_key: true |
| tourist_spot     | referensec | foreign_key: true | 

## Association
belongs_to :user
belongs_to :tourist_spot




## field_trip_comments

| Column           |  Type      | Options           |
| ---------------- | ---------  | ----------------- |
| user             | references | foreign_key: true |
| field_trip       | referensec | foreign_key: true | 

## Association
belongs_to :user
belongs_to :field_trip

## like