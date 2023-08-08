class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.references :variation, null: false, foreign_key: true
      t.references :warehouse, null: false, foreign_key: true
      t.integer :quantity
      t.integer :updated_by_user_id

      t.timestamps
    end
    add_foreign_key :inventories, :users, column: :updated_by_user_id
  end
end
