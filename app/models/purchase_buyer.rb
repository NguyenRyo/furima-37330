class PurchaseBuyer
  include ActiveModel ::Model
  attr_accessor :item_id, :user_id, :postalcode, :prefecture_id, :city, :address, :building, :tel

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postalcode,  format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture,  numericality: {other_than: 0, message: "can't be blank"}
    validates :city,        message: "can't be blank"
    validates :address,     message: "can't be blank"
    validates :tel,         numericality: {with: /\A[0-9]{10,11}\z/, message: "Phone number is invalid. Input only number with half-width"}
  end

  validates :building

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)]
    Buyer.create(postalcode: postalcode, :prefecture_id, city: city, address: address, building: building, tel: tel, purchase_id: purchase_id)
  end

end
