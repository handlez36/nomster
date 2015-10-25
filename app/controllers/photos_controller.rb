class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @place = Place.find( params[:place_id] )
    
    if @place.user == current_user
      @place.photos.create(photo_params)
    end
    
    redirect_to place_path(@place)
    
  end
  
  def photo_params
    params.require(:photo).permit(:picture, :caption)
  end
end
