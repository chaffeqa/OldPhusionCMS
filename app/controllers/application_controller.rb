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
    unless @home_node
      @home_node = Node.where(:menu_name => 'Home').first
      if @home_node.nil?
        raise ActiveRecord::RecordNotFound, "Home Page not detected!"
      end
    end
  rescue ActiveRecord::RecordNotFound
    flash[:important_notice] = "Home Page not detected, please create one. #{button_to 'Create Home', new_node_path(:home => "true")}"
    redirect_to()
    return false
  end
  
end
