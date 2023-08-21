require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = FactoryBot.create(:user)
  end

  test "should be valid" do
    assert @user.valid?, @user.errors.full_messages.join(", ")
  end
  
  test "should have email" do
    @user.email = nil
    assert_not @user.valid?, "User should not be valid without an email"
  end

  test "should have password" do
    @user.password = nil
    assert_not @user.valid?, "User should not be valid without a password"
  end

  test "should have a unique email" do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?, "User should not be valid with a duplicate email"
  end

  test "should have a unique token" do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?, "User should not be valid with a duplicate token"
  end
  
  # test "the truth" do
  #   assert true
  # end
end
