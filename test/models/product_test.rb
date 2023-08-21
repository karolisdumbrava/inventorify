require "test_helper"

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = FactoryBot.create(:product)
  end

  test "should be valid" do
    assert @product.valid?, @product.errors.full_messages.join(", ")
  end

  test "should have a name" do
    @product.name = nil
    assert_not @product.valid?, "Product should not be valid without a name"
  end

  test "should have a description" do
    @product.description = nil
    assert_not @product.valid?, "Product should not be valid without a description"
  end

  test "should be unique" do
    duplicate_product = @product.dup
    assert_not duplicate_product.valid?, "Product should not be valid with a duplicate name"
  end
  

end
