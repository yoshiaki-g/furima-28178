class User < ApplicationRecord
  has_many :items
  has_many :orders
  VALID_ZENKAKU = /\A[ぁ-んァ-ン一-龥]/
  VALID_ZENKAKU_KANA = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: "Include both letters and numbers"}
    validates :family_name, format: { with: VALID_ZENKAKU, message: "Full-width characters"}
    validates :first_name, format: { with: VALID_ZENKAKU, message: "Full-width characters"}
    validates :family_name_kana, format: { with: VALID_ZENKAKU_KANA, message: "Full-width katakana characters"}
    validates :first_name_kana, format: { with: VALID_ZENKAKU_KANA, message: "Full-width katakana characters"}
    validates :name ,:birthday
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
