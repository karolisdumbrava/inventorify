class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse
  belongs_to :variation
  belongs_to :updated_by, class_name: "User", foreign_key: "updated_by_user_id"
end
