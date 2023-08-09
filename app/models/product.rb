class Product < ApplicationRecord
  belongs_to :user
  belongs_to :warehouse
  has_many :variations
  has_many :inventories
end
