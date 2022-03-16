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
| encrypted_password | string | null: false               |
| firstname_kanji    | string | null: false               |
| lastname_kanji     | string | null: false               |
| firstname_furigana | string | null: false               | 
| lastname_furigana  | string | null: false               | 
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

# items table
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| deliver_fee_cover_id | integer    | null: false                    | 
| prefecture_id        | integer    | null: false                    |
| deliver_date_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- has_one    :purchase
- belongs_to :user

# purchases table
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :buyer


# Buyers table
| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postalcode    | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| building      | string    |                                |
| tel           | string    | null: false                    | 
| purchase      | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase





