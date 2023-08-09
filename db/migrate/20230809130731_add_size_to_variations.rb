class AddSizeToVariations < ActiveRecord::Migration[7.0]
  def change
    add_column :variations, :size, :string
  end
end
