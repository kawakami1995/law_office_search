FactoryBot.define do
  factory :user1, class: User do
    user_name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'aaaaaa' }
    password_confirmation { 'aaaaaa' }
  end

  factory :user2, class: User do
    user_name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'bbbbbb' }
    password_confirmation { 'bbbbbb' }
  end
end
