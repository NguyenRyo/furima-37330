# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# Table design
## users table
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| name_kanji         | string | null: false               |
| name_furigana      | string | null: false               | 
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

# items table
| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| title             | string      | null: false                    |
| description       | text        | null: false                    |
| category          | string      | null: false                    |
| condition         | string      | null: false                    |
| deliver_fee_cover | string      | null: false                    | 
| deliver_area      | string      | null: false                    |
| deliver_date      | date        | null: false                    |
| price             | integer     | null: false                    |
| user_id           | references  | null: false, foreign_key: true |

### Association
- has_one    :purchase
- belongs_to :user

# purchases table
| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user_id_item     | references  | null: false, foreign_key: true |
| user_id_purchase | references  | null: false, foreign_key: true |
| item_id          | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :deliver


# Deliveries table
| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| postalcode  | string    | null: false                    |
| prefecture  | string    | null: false                    |
| city        | string    | null: false                    |
| address     | string    | null: false                    |
| building    | string    |                                |
| tel         | string    | null: false                    | 
| purchase_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase





