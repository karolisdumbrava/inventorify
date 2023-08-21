FactoryBot.define do
    factory :warehouse do
        name { "Test Warehouse" }
        address { "Test Address" }
        capacity { 1000 }
        association :manager, factory: :user
    end
end