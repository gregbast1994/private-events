require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:greg)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '' } }
    assert_template 'sessions/new'
    assert_not_empty flash.now[:danger]
  end

  test 'login with valid information followed by logout' do
    get login_path
    #login
    post login_path, params: { session: { email: @user.email } }
    user = assigns(:user)
    assert_redirected_to user
    follow_redirect!
    assert_template 'users/show'
    assert logged_in?
    assert_select 'a[href=?]', '/logout'
    #logout
    delete logout_path
    assert_redirected_to root_url
    assert_not_empty flash[:success]
    assert_not logged_in?
  end
end
