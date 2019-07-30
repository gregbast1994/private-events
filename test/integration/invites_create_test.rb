require 'test_helper'

class InvitesCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:greg)
    @other_user = users(:adina)
    @event = @user.events.first
  end

  test 'invite another user, check for invite and reject invite' do
    log_in_as(@user)
    @user.invite(@other_user, @event)
    assert @other_user.has_invite_to?(@event)
    @invite = @other_user.received_invites.last
    @other_user.reject(@invite)
    assert_not @other_user.has_invite_to?(@event)
  end
end
