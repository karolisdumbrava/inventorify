class AddCapacityToWarehouses < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouses, :capacity, :integer, default: 1000, null: false
    add_column :warehouses, :used_space, :integer, default: 0, null: false

    execute <<-SQL
      ALTER TABLE warehouses ADD CONSTRAINT chk_warehouses_used_space_nonnegative CHECK (used_space >= 0);
    SQL

    execute <<-SQL
      ALTER TABLE warehouses ADD CONSTRAINT chk_warehouses_capacity_nonnegative CHECK (capacity >= 0);
    SQL
  end
end
