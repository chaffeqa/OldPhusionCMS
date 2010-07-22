class Element < ActiveRecord::Base
  belongs_to :template
  belongs_to :elem, :polymorphic => true

  ELEM_TYPES = [
    ["Text"         ,   "new_text_elem"    ],
    ["Blog"         ,   "new_blog_elem"    ],
    ["Donation"     ,   "new_donation_elem"],
    ["Calendar"     ,   "new_text_elem"    ],
    ["Form"         ,   "new_blog_elem"    ],
    ["File or Link" ,   "new_link_elem"    ],
    ["Evite"        ,   "new_evite_elem"   ],
    ["Login"        ,   "new_login_elem"   ],
    ["Photo Galary" ,   "new_photo_elem"   ]
  ]

  def self.get_elem_select
    ELEM_TYPES
  end
end
