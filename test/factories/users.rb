FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        reset_password_token { Faker::Internet.password }
        created_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
        updated_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    end
end
        