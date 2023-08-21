class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse
  belongs_to :variation
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_user_id"

  has_many :inventory_transactions
  has_one :restock_alert, dependent: :destroy

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_uniqueness_of :product_id, scope: [:warehouse_id, :variation_id], message: "should have a unique product, warehouse, and variation"
  
  after_save :check_restock_alert

  def check_restock_alert
    return unless self.restock_alert.present?

    if self.quantity <= self.restock_alert.threshold
      self.restock_alert.update(status: RestockAlert::TRIGGERED)
    elsif self.quantity > self.restock_alert.threshold
      self.restock_alert.update(status: RestockAlert::PENDING)
    end
  end
  
end
