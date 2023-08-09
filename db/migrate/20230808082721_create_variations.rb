class CreateVariations < ActiveRecord::Migration[7.0]
  def change
    create_table :variations do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end

    unless index_exists?(:variations, :product_id, name: "index_variations_on_product_id")
      add_index :variations, :product_id, name: "index_variations_on_product_id"
    end
  end
end
