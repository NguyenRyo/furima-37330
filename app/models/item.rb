class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :deliver_fee_cover, :prefecture, :deliver_date

  #空の投稿を保存できないようにする
  validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,           numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,         numericality: { other_than: 0 , message: "can't be blank"}
  validates :deliver_fee_cover_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :deliver_date_id,       numericality: { other_than: 1 , message: "can't be blank"}
    
end
