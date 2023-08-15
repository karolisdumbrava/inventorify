class InventoryTransaction < ApplicationRecord
    belongs_to :inventory
    belongs_to :initiated_by, class_name: "User", foreign_key: "user_id"

    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :transaction_type, presence: true, inclusion: { in: %w(sale restock return adjustment) }

    validate :quantity_cannot_be_greater_than_inventory_quantity, if: -> { transaction_type == "sale" }

    after_save :adjust_inventory_quantity_on_save
    after_destroy :adjust_inventory_quantity_on_destroy

    def adjust_inventory_quantity_on_save
        if saved_change_to_attribute?(:quantity) || saved_change_to_attribute?(:transaction_type)
            old_quantity = self.quantity_before_last_save
            old_transaction_type = self.transaction_type_before_last_save

            revert_inventory_adjustment(old_transaction_type, old_quantity)
        end

        adjust_inventory_quantity(transaction_type, quantity)

    end

    def adjust_inventory_quantity_on_destroy
        revert_inventory_adjustment(transaction_type, quantity)
    end

    def quantity_cannot_be_greater_than_inventory_quantity
        if quantity > inventory.quantity
            errors.add(:quantity, "cannot be greater than inventory quantity")
        end
    end
    

    def adjust_inventory_quantity(transaction_type, quantity)
        case transaction_type
        when "sale"
            inventory.quantity -= quantity
        when "restock", "return"
            inventory.quantity += quantity
        when "adjustment"
            inventory.quantity = quantity
        end

        inventory.save
    end

    def revert_inventory_adjustment(transaction_type, quantity)
        case transaction_type
        when "sale"
            inventory.quantity += quantity
        when "restock", "return"
            inventory.quantity -= quantity
        when "adjustment"
            inventory.quantity = quantity
        end
        inventory.save
    end
end
