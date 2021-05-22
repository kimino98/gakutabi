# README

## usersテーブル

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

## Association