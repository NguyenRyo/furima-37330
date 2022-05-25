class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :deliver_fee_cover
  belongs_to :prefecture
  belongs_to :deliver_date
  belongs_to :user

  has_one_attached :image
  has_one          :purchase

  validates :image      , presence: true

  #空の投稿を保存できないようにする
  validates :title      , presence: true
  validates :description, presence: true


  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,         numericality: { other_than: 0 , message: "can't be blank"}
  validates :deliver_fee_cover_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliver_date_id,       numericality: { other_than: 1 , message: "can't be blank"}
  
  VALID_price_REGEX = /\A[0-9]+\z/.freeze
  validates :price,                 numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 , message: "can't be blank"}
  validates :price,                 format: { with: VALID_price_REGEX}

end
