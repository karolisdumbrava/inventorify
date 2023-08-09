class RemoveWarehouseIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :warehouse, index: true, foreign_key: true
  end
end
