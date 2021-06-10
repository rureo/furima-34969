FactoryBot.define do
  factory :user do
    nickname                      {Faker::Name.initials}
    name_last                     {"田中"}
    name_first                    {"太郎"}
    name_last_reading             {"タナカ"}
    name_first_reading          　 {"タロウ}
    email                         {Faker::Internet.free_email}
    password                      {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday                       {1960-05-29}
  end
end