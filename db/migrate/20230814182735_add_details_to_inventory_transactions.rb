class AddDetailsToInventoryTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :inventory_transactions, :transaction_type, :string
    add_column :inventory_transactions, :quantity, :integer
    add_column :inventory_transactions, :user_id, :integer
    add_column :inventory_transactions, :inventory_id, :integer

    add_foreign_key :inventory_transactions, :users, column: :user_id
    add_foreign_key :inventory_transactions, :inventories, column: :inventory_id
  end
end
