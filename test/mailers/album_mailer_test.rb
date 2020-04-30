require 'test_helper'

class AlbumMailerTest < ActionMailer::TestCase
  test "new_album" do
    mail = AlbumMailer.new_album
    assert_equal "New album", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
  test "destroy_album" do
mail = AlbumMailer.destroy_album
assert_equal "Destroy album", mail.subject
assert_equal ["to@example.org"], mail.to
assert_equal ["from@example.com"], mail.from
assert_match "Hi", mail.body.encoded
end

end
