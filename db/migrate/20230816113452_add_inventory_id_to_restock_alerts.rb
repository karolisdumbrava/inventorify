class AddInventoryIdToRestockAlerts < ActiveRecord::Migration[7.0]
  def change
    add_reference :restock_alerts, :inventory, index: true, foreign_key: true
    remove_reference :restock_alerts, :variation
  end
end
