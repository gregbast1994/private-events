require 'test_helper'

class EventCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:greg)
  end

  test 'post event with invalid information' do
    log_in_as(@user)
    get new_event_path
    assert_template 'events/new'
    assert_no_difference 'Event.count' do
      post events_path, params: { event: { title: '',
                                          description: 'descrption',
                                          event_date: 42.days.from_now,
                                          location: 'location' } }
    end

    assert_select '#errors', count: 1
    assert_difference 'Event.count' do
      post events_path, params: { event: { title: 'hello',
                                          description: 'descrption',
                                          event_date: 42.days.from_now,
                                          location: 'location' } }
    end
    event = assigns(:event)
    assert_redirected_to event
    follow_redirect!
    assert_template 'events/show'
  end
                                         
end
