FactoryBot.define do
  factory :user do
    name              {"abe"}
    email { Faker::Internet.email }
    password              {"00000a00"}
    password_confirmation {password}
    family_name           {"阿部"}
    first_name            {"太郎"}
    family_name_kana      {"アベ"}
    first_name_kana       {"タロウ"}
    birthday              {"1999/2/28"}
  end
end