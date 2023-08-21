require "test_helper"

class WarehouseTest < ActiveSupport::TestCase
  def setup
    @warehouse = FactoryBot.create(:warehouse)
  end

  test "should be valid" do
    assert @warehouse.valid?, @warehouse.errors.full_messages.join(", ")
  end

  test "name should be present" do
    @warehouse.name = ""
    assert_not @warehouse.valid?, "Warehouse should not be valid without a name"
  end

  test "capacity should be present" do
    @warehouse.capacity = nil
    assert_not @warehouse.valid?, "Warehouse should not be valid without a capacity"
  end

  test "capacity should be an integer" do
    @warehouse.capacity = 1.5
    assert_not @warehouse.valid?, "Warehouse should not be valid with a non-integer capacity"
  end

  test "capacity should not be negative" do
    @warehouse.capacity = -1
    assert_not @warehouse.valid?, "Warehouse should not be valid with a negative capacity"
  end

  test "used_space should be present" do
    @warehouse.used_space = nil
    assert_not @warehouse.valid?, "Warehouse should not be valid without a used_space"
  end

  test "used_space should be an integer" do
    @warehouse.used_space = 1.5
    assert_not @warehouse.valid?, "Warehouse should not be valid with a non-integer used_space"
  end

  test "used_space should not be negative" do
    @warehouse.used_space = -1
    assert_not @warehouse.valid?, "Warehouse should not be valid with a negative used_space"
  end

  test "used_space should not exceed capacity" do
    @warehouse.used_space = @warehouse.capacity + 1
    assert_not @warehouse.valid?, "Warehouse should not be valid with used_space exceeding capacity"
  end

  

end
