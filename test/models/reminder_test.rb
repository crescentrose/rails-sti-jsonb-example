require 'test_helper'
require 'time'

class ReminderTest < ActiveSupport::TestCase
  setup do
    @reminder = Reminder.first
  end

  test 'should access methods from base class' do
    assert_equal false, @reminder.completed?
  end

  test 'should not have data from alerts' do
    assert_not_respond_to @reminder, :alert_at
  end
end

class AlertTest < ActiveSupport::TestCase
  setup do
    @alert = Alert.first
  end

  test 'should access data from json' do
    assert_equal Time.parse("2018-08-06 17:08:24 +0200"), @alert.alert_at
  end
end

class NotesTest < ActiveSupport::TestCase
  setup do
    @notes = Note.all
  end
  
  test 'should return our domain model instead of base class' do
    @notes.each do |n|
      assert n.class == Alert || n.class == Reminder
    end
  end
end