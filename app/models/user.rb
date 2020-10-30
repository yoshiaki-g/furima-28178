class User < ApplicationRecord
  has_many :items
  has_many :purchase_histories
  with_options presence: true do
    # validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input Full-width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input Full-width characters."}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input Full-width katakana characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input Full-width katakana characters."}
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
