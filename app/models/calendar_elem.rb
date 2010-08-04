class CalendarElem < ActiveRecord::Base
  has_one :element, :as => :elem
  has_many :events

  DISPLAY_STYLES = [
    'Calendar',
    'Event List'
  ]

  def self.display_style_select
    DISPLAY_STYLES
  end

end
