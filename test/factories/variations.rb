FactoryBot.define do
    factory :variation do
        name { "Test Variation" }
        model { "Test Model" }
        color { "Test Color" }
        size { "Test Size" }
        price { 1.00 }
        association :product
        association :user
    end
end
