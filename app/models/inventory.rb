class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse
  belongs_to :variation
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_user_id"

  has_many :inventory_transactions

  def adjust_quantity(transaction_type, quantity)
    case transaction_type
    when 'sale'
      self.current_quantity -= quantity
    when 'restock', 'return', 'adjustment'
      self.current_quantity += quantity
    end
    self.save
  end

end
