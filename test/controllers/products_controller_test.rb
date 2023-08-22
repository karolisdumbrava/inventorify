require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = FactoryBot.create(:user)
    sign_in @user
    @product = FactoryBot.create(:product, user: @user)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: "New Description", name: "New name" } }
    end

    assert_redirected_to products_url
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: "New Description", name: "New name" } }
    assert_redirected_to products_url
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "should valid name" do
    @product.name = nil
    assert_not @product.valid?
  end

  test "should valid description" do
    @product.description = nil
    assert_not @product.valid?
  end

  test "should valid user" do
    @product.user = nil
    assert_not @product.valid?
  end

  test "should be unique product name" do
    duplicate_product = @product.dup
    assert_not duplicate_product.valid?
  end  

end
