class Event < ActiveRecord::Base
  belongs_to :calendar_elem

  has_event_calendar

  
end
