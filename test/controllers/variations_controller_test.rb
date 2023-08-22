require "test_helper"

class VariationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = FactoryBot.create(:user)
    sign_in @user
    @product = FactoryBot.create(:product, user: @user)
    @variation = FactoryBot.create(:variation, product: @product)
  end

  test "should get index" do
    get product_variations_url(@product)
    assert_response :success
  end

  test "should get new" do
    get new_product_variation_url(@product)
    assert_response :success
  end

  test "should create variation" do
    assert_difference('Variation.count') do
      post product_variations_url(@product), params: { variation: { color: @variation.color, storage: @variation.storage, model: @variation.model, price: @variation.price, product_id: @variation.product_id, size: @variation.size } }
    end

    assert_redirected_to product_variations_url(@product)
  end

  test "should show variation" do
    get product_variation_url(@product, @variation)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_variation_url(@product, @variation)
    assert_response :success
  end

  test "should update variation" do
    patch product_variation_url(@product, @variation), params: { variation: { color: @variation.color, storage: @variation.storage, model: @variation.model, price: @variation.price, product_id: @variation.product_id, size: @variation.size } }
    assert_redirected_to product_variations_url(@product)
  end

  test "should destroy variation" do
    assert_difference('Variation.count', -1) do
      delete product_variation_url(@product, @variation)
    end

    assert_redirected_to product_variations_url(@product)
  end

  test "should valid model" do
    @variation.model = nil
    assert_not @variation.valid?
  end

  test "should valid product" do
    @variation.product = nil
    assert_not @variation.valid?
  end

  test "should valid user" do
    @variation.user = nil
    assert_not @variation.valid?
  end

  test "should valid color" do
    @variation.color = nil
    assert_not @variation.valid?
  end

  test "should valid size" do
    @variation.size = nil
    assert_not @variation.valid?
  end

  test "should valid price" do
    @variation.price = nil
    assert_not @variation.valid?
  end

end
