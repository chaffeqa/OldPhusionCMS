class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :get_home_node

  def get_home_node
    unless @home_node
      @home_node = Node.where(:menu_name => 'Home').first
      if @home_node.nil?
        create_home_node
      end
    end
    @home_node
  rescue ActiveRecord::RecordNotFound
    create_home_node
    return @home_node
  end

  private

  def create_home_node
    @home_node = Node.create!(:menu_name => 'Home', :title => 'Home', :shortcut => 'home', :displayed => true)
#    @home_node.template TODO
  end
  
end
