class InventoryTransaction < ApplicationRecord
    belongs_to :inventory
    belongs_to :initiated_by, class_name: "User", foreign_key: "user_id"

    quantity: integer
    transaction_type: string
    date: date
    initiated_by: user
end
