class Variation < ApplicationRecord
  belongs_to :product
  belongs_to :user
  
  has_many :inventories
  
  validates :name, presence: true
end
