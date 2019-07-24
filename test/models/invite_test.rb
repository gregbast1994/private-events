require 'test_helper'

class InviteTest < ActiveSupport::TestCase
  def setup
    @invite = Invite.new(sender_id: 1, receiver_id: 2,
                         event_id: 1)
  end

  test 'sender cannot be the receiver' do
    @invite.receiver_id = 1
    assert_not @invite.valid?
  end
end
