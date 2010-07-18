class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :get_home_node


  def get_home_node
    unless @home_node
      @home_node = Node.where(:menu_name => 'Home').first
      if @home_node.nil?
        flash[:important_notice] = 'Home Page not detected, please create one.'
        redirect_to(new_node_path(:home => "true"))
        return false
      end
    end
    @home_node
  rescue ActiveRecord::RecordNotFound
    flash[:important_notice] = 'Home Page not detected, please create one.'
    redirect_to(new_node_path(:home => "true"))
    return false
  end
  
end
