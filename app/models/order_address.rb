class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :cities, :address, :building_name, :phone_number, :token, :user_id, :item_id
  with_options presence: true do
    validates :prefecture_id, :cities, :address, :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, cities: cities, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end