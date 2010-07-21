class Element < ActiveRecord::Base
  belongs_to :template
  belongs_to :elem, :polymorphic => true
end
