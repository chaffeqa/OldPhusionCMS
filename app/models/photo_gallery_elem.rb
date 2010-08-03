class PhotoGalleryElem < ActiveRecord::Base
  has_one :element, :as => :elem
  has_many :photos

  DISPLAY_STYLES = [
    'Thumbnail',
    'Thumbnail + Caption',
    'Slideshow'
  ]

  def self.display_style_select
    DISPLAY_STYLES
  end
end
