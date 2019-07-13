require 'test_helper'

class ApplicationHelperTest < ActionDispatch::IntegrationTest
  test "base_title" do
    base = 'Private Events'
    assert_not_equal base_title('about'), base
  end

end
