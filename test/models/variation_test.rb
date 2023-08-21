require "test_helper"

class VariationTest < ActiveSupport::TestCase

  def setup
    @variation = FactoryBot.create(:variation)
  end

  test "should be valid" do
    assert @variation.valid?, @variation.errors.full_messages.join(", ")
  end
  

  # test "the truth" do
  #   assert true
  # end
end
