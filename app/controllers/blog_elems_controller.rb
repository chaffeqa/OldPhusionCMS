class BlogElemsController < ApplicationController 
  before_filter :get_template


  def show
  end

  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @blog_elem = @element.elem=BlogElem.new
  end


  def edit
    @element = @blog_elem.element
  end


  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @blog_elem = @element.elem = BlogElem.new(params[:blog_elem])
    if @blog_elem.save and @element.save and @node.template.elements << @element
      redirect_to blog_elem_path(@blog_elem, :notice => "Blog Element successfully added!")
    else
      render :action => 'new'
    end
  end


  def update
    @element = @blog_elem.element
    if @blog_elem.update_attributes(params[:blog_elem])
      redirect_to blog_elem_path(@blog_elem, :notice => "Blog Element successfully updated!")
    else
      render :action => 'edit'
    end
  end



  private
  def get_template
    if params[:id]
      @blog_elem = BlogElem.find(params[:id])
      @node = @blog_elem.element.template.node
    end
    super
  end


end
