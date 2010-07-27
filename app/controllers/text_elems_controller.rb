class TextElemsController < ApplicationController
  before_filter :get_template


  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @text_elem = @element.elem=TextElem.new
    respond_to do |format|
      format.html {render_node_template}
      format.js
    end
  end


  def edit
    @text_elem = TextElem.find(params[:id])
    @element=@text_elem.element
    respond_to do |format|
      format.html {render_node_template}
      format.js
    end
  end


  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @text_elem = @element.elem=TextElem.new(params[:text_elem])
    respond_to do |format|
      if @text_elem.save and @element.save and @node.template.elements << @element
        format.html { redirect_to admin_shortcut_path(@node.shortcut, :notice => "Element successfully added!") }
        format.js
      else
        format.html { render_node_template("Error in Creating the Element.") }
        format.js
      end
    end
  end


  def update
    @text_elem = TextElem.find(params[:id])
    @element = @text_elem.element
    respond_to do |format|
      if @text_elem.update_attributes(params[:text_elem])
        format.html { redirect_to admin_shortcut_path(@node.shortcut, :notice => "Element successfully updated!") }
        format.js
      else
        format.html { render_node_template("Error in updating the Element.") }
        format.js
      end
    end
  end


  def destroy
    @text_elem = TextElem.find(params[:id])
    @element = @text_elem.element
    @element.destroy
    respond_to do |format|
      format.html { render_node_template }
      format.js
    end
  end



  



end
