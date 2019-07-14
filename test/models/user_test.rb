require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'greg', 
                     email: 'greg@email.com')
  end

  test 'name required' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email required' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should be unique' do
    @user.save
    @other_user = User.new(name: 'greg2',
                           email: @user.email)
    assert_not @other_user.valid?
  end

  test 'email should be downcased' do
    mixed_email = 'GrEg@AoL.CoM'
    @user.email = mixed_email
    @user.save
    @user.reload
    assert_not_equal @user.email, mixed_email
  end
end
