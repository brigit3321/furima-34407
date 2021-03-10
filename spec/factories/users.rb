FactoryBot.define do
  factory :user do
    nickname { 'test太郎' }
    email {Faker::Internet.free_email}
    password {  Faker::Internet.password(min_length: 6) }
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    user_birth_date  {"2000-01-01"}
  end
end