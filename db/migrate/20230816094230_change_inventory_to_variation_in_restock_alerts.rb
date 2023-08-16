class ChangeInventoryToVariationInRestockAlerts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :restock_alerts, :inventory, index: true, foreign_key: true
    add_reference :restock_alerts, :variation, index: true, foreign_key: true
  end
end
