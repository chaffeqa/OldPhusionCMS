class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :get_home_node, :home_node?

  def get_home_node
    if home_node?
      return @home_node
    end
    return nil
  end

  def home_node?
    if @checked
      return false
    end
    unless @home_node
      @home_node = Node.where(:menu_name => 'Home').first
      if @home_node.nil?
        @checked = true
        return false
      end
    end
  rescue ActiveRecord::RecordNotFound
    return false
  end
  
end
