FactoryBot.define do
    factory :inventory do
        association :product
        association :warehouse
        association :variation
        quantity { 10 }
        association :updated_by, factory: :user
        # after(:create) do |inventory|
        #     create(:restock_alert, inventory: inventory)
        # end
    end
end