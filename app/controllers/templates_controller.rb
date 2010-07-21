class TemplatesController < ApplicationController
  before_filter :get_template
  
  def show
    @elements = @template.elements
  end

  def edit
    @elements = @template.elements
  end

  private

  def get_template
    @node = Node.where(:shortcut => params[:shortcut]).first if params[:shortcut]
    unless @node
      flash[:important_notice] = "No Page exists with the name: #{params[:shortcut]}. Please create one."
      redirect_to new_node_path
    end
    unless @node or @node.template or @node.template.view
      flash[:important_notice] = "This Page does not have legal template, please choose one."
      redirect_to edit_node_path(@node)
    end
    @template = @node.template
  end

end
