class CreateRestockAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :restock_alerts do |t|
      t.references :inventory, null: false, foreign_key: true
      t.integer :threshold
      t.string :status
      t.integer :assigned_to_user_id

      t.timestamps
    end
    add_foreign_key :restock_alerts, :users, column: :assigned_to_user_id
  end
end
