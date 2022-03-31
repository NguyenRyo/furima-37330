class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze #氏名は全角でないと登録できない
  validates :nickname          , presence: true
  validates :firstname_kanji   , presence: true, format: {with: VALID_NAME_REGEX, message: 'require full-width character'}
  validates :lastname_kanji    , presence: true, format: {with: VALID_NAME_REGEX, message: 'require full-width character'}
  validates :firstname_furigana, presence: true
  validates :lastname_furigana , presence: true
  validates :birthday          , presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #パスワードは英数混合でなければ保存できない
  validates :password          , presence: true, format: {with: VALID_PASSWORD_REGEX, message: 'include both letters and numbers'}

end
