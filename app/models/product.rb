class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name], using: { tsearch: { prefix: true } }
  
  belongs_to :user
  has_many :variations
  has_many :inventories

  validates :name, presence: true
  validates :description, presence: true
  validates_uniqueness_of :name, scope: :user_id, message: "should have a unique name"

end
