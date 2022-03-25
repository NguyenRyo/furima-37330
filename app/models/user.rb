class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname          , presence: true
  validates :firstname_kanji   , presence: true
  validates :lastname_kanji    , presence: true
  validates :firstname_furigana, presence: true
  validates :lastname_furigana , presence: true
  validates :birthday          , presence: true

end
