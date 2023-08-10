class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name], using: { tsearch: { prefix: true } }
  
  belongs_to :user
  has_many :variations
  has_many :inventories
end
