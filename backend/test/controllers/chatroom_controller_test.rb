require "test_helper"

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    user = users(:one)
    chatroom1 = Chatroom.create(name: "chatroom1", description: "chatroom description", user: user)
    chatroom2 = Chatroom.create(name: "chatroom2", description: "chatroom description", user: user)
  end

  test "should show chatroom" do
    user = users(:one)
    chatroom = user.chatrooms.first
  end

  test "should return error when chatroom is not found" do
    user = users(:one)
  end

  test "should return unauthorized when user has reached maximum number of chatrooms" do
    user = users(:one)
    user.chatrooms.destroy_all
  end

  test "should create chatroom" do
    @user = User.create(username: "john")
    #@controller.instance_variable_set('@current_user', @user)
  end

  test "should not create chatroom if user is banned" do
    @user = User.create(username: "jane", banned: true)
  end

  test "should return error if chatroom params are invalid" do
    @user = User.create(username: "jane")
  end

  
end
