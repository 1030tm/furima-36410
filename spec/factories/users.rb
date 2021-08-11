FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name             {Gimei.first.kanji}
    first_name            {Gimei.last.kanji}
    last_kana             {Gimei.first.katakana}
    first_kana            {Gimei.last.katakana}
    birthday              {'2020-08-09'}
  end
end