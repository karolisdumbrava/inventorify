class AddWarehouseIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :warehouse, null: false, foreign_key: true
  end
end
