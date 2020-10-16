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
| birthday         | date       | null: false                  |

### Association

* has_many :items
* has_many :purchases


## purchases テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| item             | string     | null:false,foreign_key:true  |
| user             | references | null:false,foreign_key:true  |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :addresses


## items テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| name             | string     | null: false                  |
| description      | text       | null: false                  |
| category         | integer    | null: false                  |
| condition        | integer    | null: false                  |
| shopping_cost_id | integer    | null: false                  |
| prefecture       | integer    | null: false                  |
| shopping_days_id | integer    | null: false                  |
| price            | integer    | null: false                  |
| user             | references | null: false,foreign_key:true |

### Association

- belongs_to :users
- belongs_to :purchases
- belongs_to :prefecture
- belongs_to :category
- belongs_to :condition
- belongs_to :shopping_cost
- belongs_to :shopping_days


## addresses テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| post_code        | string     | null: false                  |
| prefecture       | string     | null: false                  |
| city             | siring     | null: false                  |
| street           | string     | null: false                  |
| building_name    | string     | null: false                  |
| phone_number     | string     | null: false                  |
| purchase         | references | null: false,foreign_key:true |

### Association

- belongs_to :purchases
- belongs_to :prefecture


##  prefecture テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| prefecture       | string     | null: false 

### Association

- has_many :addresses
- has_many :items


## category テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| category         | string     | null: false  

### Association

- has_many :items



## condition テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| condition        | string     | null: false  

### Association

- has_many :items


## shopping_cost テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| shopping_cost    | string     | null: false  

### Association

- has_many :items


## shopping_days テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | -----------                  |
| shopping_days    | string     | null: false  

### Association

- has_many :items
