class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :managed_warehouses, class_name: "Warehouse", foreign_key: "manager_id"
  has_many :assigned_restock_alerts, class_name: "RestockAlert", foreign_key: "assigned_to_user_id"
  has_many :updated_inventories, class_name: "Inventory", foreign_key: "updated_by_user_id"
  has_many :products

  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true
end
