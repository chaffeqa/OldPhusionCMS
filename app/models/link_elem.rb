class LinkElem < ActiveRecord::Base
  has_one :element, :as => :elem
  
end
