class Photo < ActiveRecord::Base
  belongs_to :photo_gallery_elem

  has_attached_file :image,
    :url  => "/files/photo_gallery_files/photo_:id.:extension",
    :path => ":rails_root/public/files/photo_gallery_files/photo_:id.:extension",
    :styles => {:thumb => ["80x80>", :png], :medium => ["300x300>", :png]}

  


end
