FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    last_name             {'ひらがな'}
    first_name            {'ひらがな'}
    last_kana             {'カタカナ'}
    first_kana            {'カタカナ'}
    birthday{(0+1i)} 
    birthday(2i)          {'1'}
    birthday(3i)          {'1'}
    
  end
end