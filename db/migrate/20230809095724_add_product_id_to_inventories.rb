class AddProductIdToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :product_id, :integer
  end
end
