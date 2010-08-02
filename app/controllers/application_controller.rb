class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :get_home_node, :admin?

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


  def get_template
    get_home_node
    @node = Node.where(:shortcut => params[:shortcut]).first if params[:shortcut]
    if @node
      if @node.template
        @template = @node.template
        @elements = @template.elements.elem_order
        @shortcut = @node.shortcut
      else
        flash[:important_notice] = "This Page does not have legal template, please choose one."
        redirect_to edit_node_path(@node)
      end
    else
      flash[:important_notice] = "No Page exists with this name. Please create one."
      redirect_to new_node_path
    end
    
  end

  #TODO
  def admin?
    true
  end
  

  def render_node_template(error_message="Error")
    if @node and @template
      render 'templates/edit', :important_notice => error_message
    else 
      redirect_to root_url(), :important_notic => error_message.to_s
    end
  end

  private

  def create_home_node
    @home_node = Node.create!(:menu_name => 'Home', :title => 'Home', :shortcut => 'home', :displayed => true)
    @home_node.create_template(:template_name => 'Home')
  end
  
end
