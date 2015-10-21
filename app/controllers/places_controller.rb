class PlacesController < ApplicationController
    def index
      # @places = Place.all
      
      # Paginated db pull
      @places = Place.paginate( :page => params[:page], :per_page => 5 )
      #@places = Place.page( params[:page] )
    end
end
