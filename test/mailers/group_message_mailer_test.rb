require 'test_helper'

class GroupMessageMailerTest < ActionMailer::TestCase
  test "event" do
    mail = GroupMessageMailer.event
    assert_equal "Event", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
