class Warehouse < ApplicationRecord
  belongs_to :manager, class_name: "User"
  has_many: :inventories
end
