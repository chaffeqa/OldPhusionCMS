class Element < ActiveRecord::Base
  belongs_to :template
  belongs_to :elem, :polymorphic => true, :dependent => :destroy

  ELEM_TYPES = [
    ["Text"         ,   "text_elems"    ],
    ["Blog"         ,   "blog_elems"    ],
    ["Donation"     ,   "donation_elems"],
    ["Calendar"     ,   "text_elems"    ],
    ["Form"         ,   "blog_elems"    ],
    ["File"         ,   "file_elems"    ],
    ["Link"         ,   "link_elems"    ],
    ["Evite"        ,   "evite_elems"   ],
    ["Login"        ,   "login_elems"   ],
    ["Photo Galary" ,   "photo_elems"   ]
  ]

  # Scopes

  # Returns the elements ordered from highest (first) to lowest (last)
  scope :elem_order, order('column_order asc')
  # Returns all Elements with the position passed in
  scope :position_elems, lambda {|position|
    where(:position => position)
  }
  # Returns the ordered elements for the passed in position
  scope :elements_for_position, lambda {|position|
    position_elems(position).elem_order
  }
  # Returns the next highest available column_order number for the passed in position
  def self.set_highest_column_order(position)
    col_order = 0 + Element.position_elems(position).count
    col_order
  end

  
  # Select array
  def self.get_elem_select
    ELEM_TYPES
  end
end
