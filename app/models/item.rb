class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history

  with_options presence: true do
  end
end
