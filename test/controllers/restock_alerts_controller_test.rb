require "test_helper"

class RestockAlertsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get restock_alerts_new_url
    assert_response :success
  end

  test "should get create" do
    get restock_alerts_create_url
    assert_response :success
  end

  test "should get edit" do
    get restock_alerts_edit_url
    assert_response :success
  end

  test "should get update" do
    get restock_alerts_update_url
    assert_response :success
  end
end
