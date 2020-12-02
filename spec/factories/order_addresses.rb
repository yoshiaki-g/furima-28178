FactoryBot.define do
  factory :order_address do
    postal_code    {"123-1234"}
    prefecture_id  {1}
    cities         {"大阪市北区"}
    address        {"1-1-1"}
    building_name  {"ビル"}
    phone_number   {"09000000000"}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
