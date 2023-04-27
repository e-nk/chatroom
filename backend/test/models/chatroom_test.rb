require "test_helper"

class ChatroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:one)
    @chatroom = Chatroom.new(name: "Test Chatroom", user: @user)
  end

  test "should be valid" do
    assert @chatroom.valid?
  end

  test "should require a name" do
    @chatroom.name = ""
   # assert_not @chatroom.valid?
  end

  test "should require a user" do
    @chatroom.user = nil
    assert_not @chatroom.valid?
  end

  test "should belong to a user" do
    assert_respond_to @chatroom, :user
  end

  test "should have many chatroom members" do
    assert_respond_to @chatroom, :chatroom_members
  end

  test "should have many added members through chatroom members" do
    assert_respond_to @chatroom, :added_members
  end

  test "should have many messages" do
    assert_respond_to @chatroom, :messages
  end
end
