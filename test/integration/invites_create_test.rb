require 'test_helper'

class InvitesCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:greg)
    @other_user = users(:adina)
    @event = @user.events.first
  end

  test 'should create invite for recipient' do
    log_in_as(@user)
    assert_difference 'Invite.count' do
      post invites_path, params: { invite: { receiver_id: @other_user.id, event_id: @event.id } }
    end
    assert_not_empty flash[:success]
    log_in_as @other_user
    assert_select "div.invite-#{Invite.last.id}"
  end
end
