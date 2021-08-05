# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Option               |
| ---------------- | ---------- | -------------------- |
| item_name        | string     | null: false          |
| explanation      | text       | null: false          |
| category_id      | integer    | null: false          |
| condition_id     | integer    | null: false          |
| postage_id       | integer    | null: false          |
| consignor_id     | integer    | null: false          |
| shipping_day_id  | integer    | null: false          |
| price            | integer    | null: false          |
| user             | references | foreign_key: true    |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column           | Type       | Option               |
| ---------------- | ---------- | -------------------- |
| user             | references | foreign_key: true    |
| item             | references | foreign_key: true    |

### Association

- belongs_to :item
- has_one :delivery
- belongs_to :user

## deliveries テーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| postal_code      | string     | null: false       |
| consignor_id     | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| tel              | string     | null: false       |
| buy              | references | foreign_key: true |

### Association
- belongs_to :buy
