class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  
  # The hash key is what the user will see
  # The has value is what will be stored in the db
  RATINGS = {
    'one star'    => '1_star',
    'two stars'   => '2_stars',
    'three stars' => '3_stars',
    'four stars'  => '4_stars',
    'five stars'  => '5_stars'
  }
  
  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
