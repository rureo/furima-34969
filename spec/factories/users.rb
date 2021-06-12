FactoryBot.define do
  factory :user do
    nickname                      {Faker::Name.initials}
    name_last                     {"田中"}
    name_first                    {"太郎"}
    name_reading_last             {"タナカ"}
    name_reading_first            {"タロウ"}
    email                         {Faker::Internet.free_email}
    password                      {"cde466"}
    password_confirmation {password}
    birthday                       {"1960-05-29"}
  end
end