# テーブル設計

## users テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| nickname         | string     | null: false                  |
| email            | string     | null: false                  |
| password         | string     | null: false                  |
| last_name        | string     | null: false                  |
| first_name       | string     | null: false                  |
| last_name_kana   | string     | null: false                  |
| first_name_kana  | string     | null: false                  |
| birthday         | string     | null: false                  |


## purchases テーブル
| item             | string     | null:false,foreign_key:true  |
| user             | references | null:false,foreign_key:true  |

## items テーブル

| name             | string     | null: false                  |
| description      | text       | null: false                  |
| category         | integer    | null: false                  |
| condition        | integer    | null: false                  |
| shopping_cost_id | integer    | null: false                  |
| prefecture       | integer    | null: false                  |
| shopping_days_id | integer    | null: false                  |
| price            | integer    | null: false                  |
| user             | references | null: false,foreign_key:true |


## addresses テーブル

| post_code        | string     | null: false                  |
| prefecture       | string     | null: false                  |
| city             | siring     | null: false                  |
| street           | string     | null: false                  |
| building_name    | string     | null: false                  |
| phone_number     | string     | null: false                  |
| purchase         | references | null: false,foreign_key:true |

