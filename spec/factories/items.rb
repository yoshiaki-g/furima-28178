FactoryBot.define do
  factory :item do
    name             {"syouhin"}
    explanation      {"setumei"}
    category_id      {1}
    status_id        {1}
    delivery_fee_id  {1}
    shipping_area_id {1}
    delivery_date_id {1}
    value            {500}
    association :user
  end
end
