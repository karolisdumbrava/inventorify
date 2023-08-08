class RestockAlert < ApplicationRecord
  belongs_to :assigned_to, class_name: "User", foreign_key: "assigned_to_user_id"
  belongs_to :product
end
