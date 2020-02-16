FactoryBot.define do
  factory :user do
    nickname              {"testまん"}
    sequence(:email)      {Faker::Internet.email}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"蒲焼"}
    first_name            {"三太郎"}
    last_name_kana        {"カバヤキ"}
    first_name_kana       {"サンタロウ"}
    birthdate_year        {"2001"}
    birthdate_mouth       {"2"}
    birthdate_day         {"23"}
  end
end