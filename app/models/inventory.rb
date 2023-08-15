class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse
  belongs_to :variation
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_user_id"

  has_many :inventory_transactions

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
