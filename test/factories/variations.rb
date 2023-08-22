FactoryBot.define do
    factory :variation do
        name { "Test Variation" }
        model { "Test Model" }
        color { "Test Color" }
        size { "Test Size" }
        storage { "Test Storage" }
        price { 100 }
        association :product
        association :user
    end
end
