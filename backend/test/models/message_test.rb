require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
    @chatroom = chatrooms(:one)
    @message = Message.new(user: @user, chatroom: @chatroom)
  end

  test "should be valid" do
    assert @message.valid?
  end


  test "should require a user" do
    @message.user = nil
    assert_not @message.valid?
  end

  test "should require a chatroom" do
    @message.chatroom = nil
    assert_not @message.valid?
  end

  test "should belong to a user" do
    assert_respond_to @message, :user
  end

  test "should belong to a chatroom" do
    assert_respond_to @message, :chatroom
  end

  test "should have many replies" do
    assert_respond_to @message, :replies
  end

  test "should have a parent message" do
    assert_respond_to @message, :parent_message
  end

  test "should be able to have image attachments" do
    assert_respond_to @message, :image
  end
end
