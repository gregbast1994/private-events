require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @event = events(:birthday)
  end

  test 'redirect user if not logged in' do
    get event_path(@event)
    assert_redirected_to login_path
    assert_not_empty flash[:info]
    log_in_as(@event.creator)
    follow_redirect!
    assert_template 'events/show'
  end
end
