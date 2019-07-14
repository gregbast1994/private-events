require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:greg)
    @event = @user.events.build(title: 'My b-day',
                         description: 'Lets have fun!',
                         when: 42.days.from_now,
                         where: 'My house')
  end

  test 'title should be present' do
    assert @event.valid?
    @event.title = ' '
    assert_not @event.valid?
  end

  test 'when should be present and a datetime' do
    @event.when = ' '
    assert_not @event.valid?
    @event.when = 'tomorrow'
    assert_not @event.valid?
  end

  test 'where should be present' do
    @event.where = ' '
    assert_not @event.valid?
  end

  test 'a event needs a user' do
    event = Event.new(title: 'My b-day',
                      description: 'Lets have fun!',
                      when: 42.days.from_now,
                      where: 'My house')
    assert_not event.valid?
  end

end
