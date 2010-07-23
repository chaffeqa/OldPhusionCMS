class TextElemsController < ApplicationController
  before_filter :get_template


  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @text_elem = @element.elem=TextElem.new
    respond_to do |format|
      format.html {render_node_template}
    end
  end


  def edit
    @text_elem = TextElem.find(params[:id])
    @element = @text_elem.element
    respond_to do |format|
      format.html {render_node_template}
    end
  end


  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @text_elem = @element.elem=TextElem.new(params[:text_elem])
    respond_to do |format|
      if @element.save and @node.template.elements << @element
        format.html { redirect_to admin_shortcut_path(@node.shortcut, :notice => "Element successfully added!") }
      else
        format.html { render_node_template }
      end
    end
  end


  def update
    @text_elem = TextElem.find(params[:id])
    @element = @text_elem.element
    respond_to do |format|
      if @text_elem.update_attributes(params[:text_elem])
        format.html { redirect_to admin_shortcut_path(@node.shortcut, :notice => "Element successfully updated!") }
      else
        format.html { render_node_template }
      end
    end
  end


  def destroy
    @text_elem = TextElem.find(params[:id])
    @text_elem.element.destroy
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