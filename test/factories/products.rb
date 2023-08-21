FactoryBot.define do
    factory :product do
        name { "Test Product" }
        description { "Test Description" }
        price { 1.00 }
        association :user
    end
end