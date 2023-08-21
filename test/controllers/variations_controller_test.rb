require "test_helper"

class VariationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = FactoryBot.create(:user)
    sign_in @user
    @product = FactoryBot.create(:product, user: @user)
    @variation = FactoryBot.create(:variation, product: @product)
  end


end
