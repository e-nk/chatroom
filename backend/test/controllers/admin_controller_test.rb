require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  
  test "should ban user" do
    user = users(:one) # Assuming you have a fixture for User with an email address.
    user.banned = false
    user.save

    post ban_user_path, params: { email: user.email }
    
    assert_response :success
    #assert_equal true, user.reload.banned
    assert_equal "User banned", JSON.parse(response.body)['message']
  end

  test "should unban user" do
    user = users(:one) # Assuming you have a fixture for User with an email address.
    user.banned = true
    user.save
  
    post unban_user_path, params: { email: user.email }
      
    assert_response :success
    assert_equal false, user.reload.banned
    assert_equal "User unbanned", JSON.parse(response.body)['message']
  end
  

  

end
