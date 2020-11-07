class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :delivery_date
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  with_options presence: true do
    validates :name, :explanation, :value, :image
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :delivery_date_id
  end
end
