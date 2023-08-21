require "test_helper"

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
    sign_in @user
    @inventory = FactoryBot.create(:inventory)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    @product = FactoryBot.create(:product)
    @warehouse = FactoryBot.create(:warehouse)
    @variation = FactoryBot.create(:variation)
    assert_difference('Inventory.count') do
      post inventories_url, params: { inventory: { product_id: @product.id, warehouse_id: @warehouse.id, variation_id: @variation.id, quantity: 10, updated_by_id: @user.id } }
    end

    assert_redirected_to inventories_path
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    @product = FactoryBot.create(:product)
    @warehouse = FactoryBot.create(:warehouse)
    @variation = FactoryBot.create(:variation)
    patch inventory_url(@inventory), params: { inventory: { product_id: @product.id, warehouse_id: @warehouse.id, variation_id: @variation.id, quantity: 10, updated_by_id: @user.id } }
    assert_redirected_to inventories_path
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_path
  end


  test "should not create inventory without product" do
    @warehouse = FactoryBot.create(:warehouse)
    @variation = FactoryBot.create(:variation)
    assert_no_difference('Inventory.count') do
      post inventories_url, params: { inventory: { product_id: nil, warehouse_id: @warehouse.id, variation_id: @variation.id, quantity: 10, updated_by_id: @user.id } }
    end
  end

  test "should not create inventory without warehouse" do
    @product = FactoryBot.create(:product)
    @variation = FactoryBot.create(:variation)
    assert_no_difference('Inventory.count') do
      post inventories_url, params: { inventory: { product_id: @product.id, warehouse_id: nil, variation_id: @variation.id, quantity: 10, updated_by_id: @user.id } }
    end
  end

  test "should not create inventory without variation" do
    @product = FactoryBot.create(:product)
    @warehouse = FactoryBot.create(:warehouse)
    assert_no_difference('Inventory.count') do
      post inventories_url, params: { inventory: { product_id: @product.id, warehouse_id: @warehouse.id, variation_id: nil, quantity: 10, updated_by_id: @user.id } }
    end
  end

  test "should not create inventory without quantity" do
    @product = FactoryBot.create(:product)
    @warehouse = FactoryBot.create(:warehouse)
    @variation = FactoryBot.create(:variation)
    assert_no_difference('Inventory.count') do
      post inventories_url, params: { inventory: { product_id: @product.id, warehouse_id: @warehouse.id, variation_id: @variation.id, quantity: nil, updated_by_id: @user.id } }
    end
  end

  
  
  # test "the truth" do
  #   assert true
  # end
end
