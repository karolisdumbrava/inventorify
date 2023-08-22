FactoryBot.define do
    factory :product do
        name { "Test Product" }
        description { "Test Description" }
        association :user
    end
end