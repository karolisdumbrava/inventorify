require_relative "../config/environment"
require "rails/test_help"

module FixtureFileHelpers
  def fake_time
    Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  end

  def fake_email
    Faker::Internet.email
  end

  def fake_password
    Faker::Internet.password(min_length: 8)
  end

  def fake_token
    SecureRandom.urlsafe_base64
  end
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include FixtureFileHelpers
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FixtureFileHelpers
  include FactoryBot::Syntax::Methods
  # Add more helper methods to be used by all tests here...
end
