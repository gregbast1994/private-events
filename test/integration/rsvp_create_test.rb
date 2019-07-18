require 'test_helper'

class RsvpCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:greg)
    @event = @user.events.first
  end

  test 'allow users to attend events' do
    get event_path(@event)
    assert_redirected_to login_path
    log_in_as(@user)
    assert_redirected_to @event
    assert_difference @user.attended_events do
      post rsvps_path, params: { event_id: @event.id }
    end
    assert_redirected_to @event
    follow_redirect!
    assert_template 'events/show'
    assert_select 'ul.event-attendees'
  end
end
