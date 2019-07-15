ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include ApplicationHelper
  fixtures :all
  
  # Add more helper methods to be used by all tests here...
  module SignInHelper
    def log_in_as(user)
      post login_path, params: { session: { email: user.email } }
    end

    def logged_in?
      !session[:user_id].nil?
    end
  end

  class ActionDispatch::IntegrationTest
    include SignInHelper
  end

end
