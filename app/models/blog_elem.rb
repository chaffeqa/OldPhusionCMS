class BlogElem < ActiveRecord::Base
  has_one :element, :as => :elem

  DISPLAY_STYLES = [
    'Title',
    'Title + Body',
    'Title + Summary',
    'Archive'
  ]

  COMMENT_OPTIONS = [
    'Disallow Comment',
    'Users must be logged in',
    'Anyone can comment'
  ]

  def self.display_style_select
    DISPLAY_STYLES
  end

  def self.commentability_select
    COMMENT_OPTIONS
  end
end
