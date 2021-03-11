FactoryBot.define do
  factory :user do
    nickname { '大福' }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '大福' }
    first_name { '大福' }
    last_name_kana { 'ダイフク' }
    first_name_kana { 'ダイフク' }
    birthday { 1234 - 0o5 - 0o6 }
  end
end
