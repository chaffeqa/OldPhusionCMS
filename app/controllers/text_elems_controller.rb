class TextElemsController < ApplicationController
  before_filter :get_template


  def show
  end

  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @text_elem = @element.elem=TextElem.new
  end


  def edit
    @element = @text_elem.element
  end


  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @text_elem = @element.elem=TextElem.new(params[:text_elem])
    if @text_elem.save and @element.save and @node.template.elements << @element
      redirect_to text_elem_path(@text_elem, :notice => "Text Element successfully added!")
    else
      render :action => 'new'  
    end
  end


  def update
    @element = @text_elem.element
    if @text_elem.update_attributes(params[:text_elem])
      redirect_to text_elem_path(@text_elem, :notice => "Text Element successfully updated!")
    else
      render :action => 'edit'
    end
  end



  private
  def get_template
    if params[:id]
      @text_elem = TextElem.find(params[:id])
      @node = @text_elem.element.template.node
    end
    super
  end


end
