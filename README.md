# テーブル設計

## users テーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_kana         | string | null: false |
| last_kana          | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :buy

## items テーブル

| Column           | Type       | Option         |
| ---------------- | ---------- | -------------- |
| image            |            | ActiveStorage  |
| item_name        | string     | null: false    |
| explanation      | text       | null: false    |
| category         |            | null: false    | ActiveHash
| condition        |            | null: false    | ActiveHash
| postage          |            | null: false    | ActiveHash
| consignor        |            | null: false    | ActiveHash
| days             |            | null: false    | ActiveHash
| price            | integer    | null: false    |
| user_id          | references |                |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column           | Type       | Option         |
| ---------------- | ---------- | -------------- |
| user             | references |                |
| item             | references |                |

### Association

- has_one :item
- has_one :delivery
- belongs_to :user

## delivery テーブル

| Column           | Type       | Option         |
| ---------------- | ---------- | -------------- |
| shipping_area    |            | null: false    | ActiveHash

- has_one :item
- has_one :buy
