require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Test triggering the /user/:id page, and make sure it shows up correctly
  test "user dashboard shows up successfully" do
    puts "Running 'user dashboard shows up successfully' test..."
    
    user = FactoryGirl.create(:user)
    sign_in user
    
    get :show, :id => user.id
    
    assert_response :success
  end
  
end
