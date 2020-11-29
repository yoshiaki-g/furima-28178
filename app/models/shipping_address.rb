class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order
  with_options presence: true do
    validates :postal_code, :prefectures_id, :cities, :address, :phone_number
    # validates :value, format: { with: /\A[0-9]+\z/, message: "Half-width characters"}
    # validates :value,  INTEGER_LONG_REQUIRED
  end
end
