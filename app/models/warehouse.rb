class Warehouse < ApplicationRecord
  belongs_to :manager, class_name: "User"
  has_many :inventories
  has_many :products
  validate :validate_used_space

  private 
  
  def validate_used_space
    if used_space > capacity
      errors.add(:used_space, "cannot exceed the warehouse's capacity")
    end
  end
end
