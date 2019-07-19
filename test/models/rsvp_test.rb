require 'test_helper'

class RsvpTest < ActiveSupport::TestCase
  
  test 'attended_event_id should be present' do
    @rsvp = Rsvp.new(attended_event_id: 1)
    assert_not @rsvp.valid?
  end

  test 'attendee_id should be present' do
    @rsvp = Rsvp.new(attendee_id: 1)
    assert_not @rsvp.valid?
  end

  test 'rows should be unique' do
    @user = users(:greg)
    @event = events(:birthday)

    assert_difference 'Rsvp.count' do
     @user.rsvps.create!(attended_event_id: @event.id)
    end

    assert_not @user.rsvps.build(attended_event_id: @event.id).valid?
  end
    
end
