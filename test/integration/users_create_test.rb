require 'test_helper'

class UsersCreateTest < ActionDispatch::IntegrationTest
  test 'signup with invalid signup' do
    get new_user_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '', email: 'greg@123.com' } }
    end
    assert_select 'ul#errors'
    assert_template 'users/new'
  end

  test 'signup with valid signup' do
    get new_user_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name: 'greg', email: 'greg@123.com' } }
    end
    user = assigns(:user)
    assert_redirected_to user
  end
end
