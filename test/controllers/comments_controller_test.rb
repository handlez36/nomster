require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "create comment requires logged in" do
    post :create, :place_id => 'omg'
    assert_redirected_to new_user_session_path
  end
  
  test "logged in user can create a comment" do
    puts "Running 'logged in user can create a comment' test..."
    
    user = FactoryGirl.create(:user)
    sign_in user
    
    place = FactoryGirl.create(:place)
    assert_difference "place.comments.count" do
      post :create, :place_id => place.id, :comment => {
        :rating => '2_stars',
        :message => 'This place aint great'
        }
    end
    
    assert_redirected_to place_path(place)
    assert_equal user, Comment.last.user
    
  end
  
  test "random person cannot destory a comment" do
    user = FactoryGirl.create(:user)
    sign_in user
    
    comment = FactoryGirl.create(:comment)
    
    delete :destroy, :id => comment.id
    #assert_response :forbidden
    
    assert Comment.find_by_id(comment.id).present?
  end
  
end
