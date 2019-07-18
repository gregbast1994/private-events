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
    
end
