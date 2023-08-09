class Product < ApplicationRecord
  belongs_to :user
  has_many :variations
  has_many :inventories
end
