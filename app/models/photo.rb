class Photo < ActiveRecord::Base
  belongs_to :place
  
  # When you include this field in a form, an uploader will be used
  mount_uploader :picture, PictureUploader
end
