FactoryBot.define do
  factory :user do
    first_name { "Kamil" }
    surname { "Mensik" }
    sequence(:email) { |n| "#{n}kamilekmensik@gmail.com" }
    password { "Heslo1" }
    created_at {"2021-07-05 10:18:57"}
    updated_at  {"2021-07-05 10:18:57"}
  end
end
