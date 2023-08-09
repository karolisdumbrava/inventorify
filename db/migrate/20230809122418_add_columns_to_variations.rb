class AddColumnsToVariations < ActiveRecord::Migration[7.0]
  def change
    add_column :variations, :model, :string
    add_column :variations, :storage, :string
    add_column :variations, :color, :string
    add_column :variations, :connectivity, :string
    add_column :variations, :region, :string
    add_column :variations, :voltage, :string
    add_column :variations, :price, :decimal
    add_column :variations, :stock_quantity, :integer
    add_column :variations, :sku, :string
    add_column :variations, :barcode, :string
    add_column :variations, :image_id, :bigint
  end
end
