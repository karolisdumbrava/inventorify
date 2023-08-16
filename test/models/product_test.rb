require "test_helper"

class ProductTest < ActiveSupport::TestCase

  def setup
    @user = User.create(email: "test@example.com", password: "password")
    @product = @user.products.create(name: "Test Product", description: "Test Description")
  end

  test 'product should be valid' do
    assert @product.valid?
  end

  test 'name should be present' do
    @product.name = ""
    assert_not @product.valid?
  end

  test 'product should belong to user' do
    @product.user_id = nil
    assert_not @product.valid?
  end
  
  test 'description should be present' do
    @product.description = ""
    assert_not @product.valid?
  end

  
end
