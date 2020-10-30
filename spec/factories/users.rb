FactoryBot.define do
  factory :user do
    name              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    family_name           {"阿部"}
    first_name            {"太郎"}
    family_name_kana      {"アベ"}
    first_name_kana       {"タロウ"}
    birthday              {"1999/2/28"}
  end
end