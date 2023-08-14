class InventoryTransaction < ApplicationRecord
    belongs_to :inventory
    belongs_to :initiated_by, class_name: "User", foreign_key: "user_id"

    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :transaction_type, presence: true, inclusion: { in: %w(sale restock return adjustment) }
end
