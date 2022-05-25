class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases

  validates :nickname          , presence: true

  VALID_NAME_kanji_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze #氏名は全角でないと登録できない
  validates :firstname_kanji   , presence: true, format: {with: VALID_NAME_kanji_REGEX, message: 'require full-width character'}
  validates :lastname_kanji    , presence: true, format: {with: VALID_NAME_kanji_REGEX, message: 'require full-width character'}

  VALID_NAME_furigana_REGEX = /\A[ァ-ヶー]+\z/.freeze #フリガナは全角でないと登録できない
  validates :firstname_furigana, presence: true, format: {with: VALID_NAME_furigana_REGEX, message: 'require full-width Furigana character'}
  validates :lastname_furigana , presence: true, format: {with: VALID_NAME_furigana_REGEX, message: 'require full-width Furigana character'}

  validates :birthday          , presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #パスワードは英数混合でなければ保存できない
  validates :password          , presence: true, format: {with: VALID_PASSWORD_REGEX, message: 'include both letters and numbers'}

end
