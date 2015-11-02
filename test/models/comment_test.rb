require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Test humanized rating functionality
  test "humanized rating functionality" do
    puts "Running humanized rating test..."

    comment = FactoryGirl.create(:comment)
    rating = comment.humanized_rating
    assert_equal rating, "one star"
    
    comment = FactoryGirl.create(:comment, :rating => "2_stars")
    rating = comment.humanized_rating
    assert_equal rating, "two stars"
    
    comment = FactoryGirl.create(:comment, :rating => "3_stars")
    rating = comment.humanized_rating
    assert_equal rating, "three stars"
    
    comment = FactoryGirl.create(:comment, :rating => "4_stars")
    rating = comment.humanized_rating
    assert_equal rating, "four stars"
    
    comment = FactoryGirl.create(:comment, :rating => "5_stars")
    rating = comment.humanized_rating
    assert_equal rating, "five stars"
    
  end

end
