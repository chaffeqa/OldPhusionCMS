class LinkElemsController < ApplicationController
  before_filter :get_template


  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @link_elem = @element.elem=LinkElem.new
    respond_to do |format|
      format.html {render_node_template}
    end
  end


  def edit
    @link_elem = LinkElem.find(params[:id])
    @element = @link_elem.element
    respond_to do |format|
      format.html {render_node_template}
    end
  end


  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @link_elem = @element.elem=LinkElem.new(params[:link_elem])
    respond_to do |format|
      if @element.save and @node.template.elements << @element
        format.html { redirect_to admin_shortcut_path(@node.shortcut, :notice => "Element successfully added!") }
      else
        format.html { render_node_template }
      end
    end
  end


  def update
    @link_elem = LinkElem.find(params[:id])
    @element = @link_elem.element
    respond_to do |format|
      if @link_elem.update_attributes(params[:link_elem])
        format.html { redirect_to admin_shortcut_path(@node.shortcut, :notice => "Element successfully updated!") }
      else
        format.html { render_node_template }
      end
    end
  end


  def destroy
    @link_elem = LinkElem.find(params[:id])
    @link_elem.element.destroy
    respond_to do |format|
      format.html { render_node_template }
    end
  end



  private

  def render_node_template
    if @node and @template
      render 'templates/edit'
    else
      flash[:important_notice] = "There was an error in attempting to create a new Text Element"
      redirect_to :back
    end
  end
end
