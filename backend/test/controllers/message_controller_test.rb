require "test_helper"

class MessageControllerTest < ActionDispatch::IntegrationTest
  
    setup do
        @chatroom = chatrooms(:one)
        @user = users(:one)
       # sign_in @user
      end
      
      
      
      test "create message with user banned" do
        @user.update(banned: true)
      end
      
      
      
      test "set_message before_action callback" do
        message = messages(:one)
       
      end
      
      test "destroy message" do
        message = messages(:one)
        
       
      end
      
      test "reply to message" do
        message = messages(:one)
        
    
      end

end
