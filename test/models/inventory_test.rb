require "test_helper"

class InventoryTest < ActiveSupport::TestCase

  puts "Starting InventoryTest"

  def setup
    @inventory = FactoryBot.create(:inventory)
  end

  test "should be valid" do
    assert @inventory.valid?, @inventory.errors.full_messages.join(", ")
  end

  test "should have a product" do
    @inventory.product = nil
    assert_not @inventory.valid?, "Inventory should not be valid without a product"
  end

  test "should have a warehouse" do
    @inventory.warehouse = nil
    assert_not @inventory.valid?, "Inventory should not be valid without a warehouse"
  end

  test "should have a variation" do
    @inventory.variation = nil
    assert_not @inventory.valid?, "Inventory should not be valid without a variation"
  end

  test "should have a quantity" do
    @inventory.quantity = nil
    assert_not @inventory.valid?, "Inventory should not be valid without a quantity"
  end

  test "should have an updated_by" do
    @inventory.updated_by = nil
    assert_not @inventory.valid?, "Inventory should not be valid without an updated_by"
  end

  test "should have a unique product, warehouse, and variation" do
    duplicate_inventory = @inventory.dup
    assert_not duplicate_inventory.valid?, "Inventory should not be valid with a duplicate product, warehouse, and variation"
  end
  
end
