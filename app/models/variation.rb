class Variation < ApplicationRecord
  belongs_to :product
  belongs_to :user
  
  has_many :inventories
  
  # validates :name, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :storage, presence: true
  
end
