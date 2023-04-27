require "test_helper"

class ChatroomMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
    @chatroom = chatrooms(:one)
    @chatroom_member = ChatroomMember.new(user: @user, chatroom: @chatroom)
  end

  test "should be valid" do
    assert @chatroom_member.valid?
  end

  test "should require a user" do
    @chatroom_member.user = nil
    assert_not @chatroom_member.valid?
  end

  test "should require a chatroom" do
    @chatroom_member.chatroom = nil
    assert_not @chatroom_member.valid?
  end

  test "should belong to a user" do
    assert_respond_to @chatroom_member, :user
  end

  test "should belong to a chatroom" do
    assert_respond_to @chatroom_member, :chatroom
  end
end
