require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:greg)
    @event = @user.events.build(title: 'My b-day',
                         description: 'Lets have fun!',
                         event_date: 42.days.from_now,
                         location: 'My house')
  end

  test 'title should be present' do
    assert @event.valid?
    @event.title = ' '
    assert_not @event.valid?
  end

  test 'datetime should be present and a datetime' do
    @event.event_date = ' '
    assert_not @event.valid?
    @event.event_date = 'tomorrow'
    assert_not @event.valid?
  end

  test 'where should be present' do
    @event.location = ' '
    assert_not @event.valid?
  end

  test 'a event needs a user' do
    event = Event.new(title: 'My b-day',
                      description: 'Lets have fun!',
                      event_date: 42.days.from_now,
                      location: 'My house')
    assert_not event.valid?
  end

end
