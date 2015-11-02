class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @place = Place.find( params[:place_id] )
    @place.comments.create( comment_params.merge(:user => current_user) )
    
    redirect_to place_path(@place)
  end
  
  def destroy
    comment = Comment.find(params[:id])
    
    if current_user == comment.user
      comment.destroy
    else
      return render :text => "Can't do that", :status => "forbidden"
    end
    
    redirect_to root_path
  end
  
  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
