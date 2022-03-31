FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    firstname_kanji       {person.first.kanji}
    lastname_kanji        {person.last.kanji}
    firstname_furigana    {person.first.katakana}
    lastname_furigana     {person.first.katakana}
    birthday              {1930/01/01}
  end
end