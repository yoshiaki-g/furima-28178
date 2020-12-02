class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :delivery_date
  belongs_to :user
  has_one :order
  # has_one_attached :image
  integer_long  = { numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } }
  INTEGER_LONG_REQUIRED  = integer_long.merge(presence: true)

  with_options presence: true do
    validates :name, :explanation, :value, :image
    validates :value, format: { with: /\A[0-9]+\z/, message: "Half-width characters"}
    validates :value,  INTEGER_LONG_REQUIRED
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :delivery_date_id
  end
  has_one_attached :image

end
