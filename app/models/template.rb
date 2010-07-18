class Template < ActiveRecord::Base
  belongs_to :node
  belongs_to :view, :polymorphic => true
end
