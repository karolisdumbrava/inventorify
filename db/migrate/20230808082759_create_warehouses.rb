class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :name
      t.text :address
      t.references :manager, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
