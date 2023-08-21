class Warehouse < ApplicationRecord
  belongs_to :manager, class_name: "User"
  has_many :inventories
  has_many :products
  validate :validate_used_space
  validates :name, presence: true
  validates :address, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :used_space, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private 
  
  def validate_used_space
    if capacity && used_space && used_space > capacity
      errors.add(:used_space, "cannot exceed the warehouse's capacity")
    end
  end
end
