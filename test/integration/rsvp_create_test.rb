require 'test_helper'

class RsvpCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:greg)
    @event = @user.events.first
  end

  test 'allow users to attend events and then leave the event' do
    get event_path(@event)
    assert_redirected_to login_path
    log_in_as(@user)
    assert_redirected_to @event
    assert_difference @user.attended_events do
      post rsvps_path, params: { event_id: @event.id }
      rsvp = assigns(:rsvp)
    end
    @user.reload
    assert_redirected_to @event
    follow_redirect!
    assert_template 'events/show'
    assert_select 'ul.event-attendees'
    assert_difference 'Rsvp.count', -1 do
      delete rsvp_path(@user.rsvps.last.id)
    end
  end
end
