class PhotoGalleryElemsController < ApplicationController
  before_filter :get_template


  def show
  end

  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @photo_gallery_elem = @element.elem=PhotoGalleryElem.new
  end


  def edit
    @element = @photo_gallery_elem.element
  end


  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @photo_gallery_elem = @element.elem = PhotoGalleryElem.new(params[:photo_gallery_elem])
    if @photo_gallery_elem.save and @element.save and @node.template.elements << @element
      redirect_to photo_gallery_elem_path(@photo_gallery_elem, :notice => "Blog Element successfully added!")
    else
      render :action => 'new'
    end
  end


  def update
    @element = @photo_gallery_elem.element
    if @photo_gallery_elem.update_attributes(params[:photo_gallery_elem])
      redirect_to photo_gallery_elem_path(@photo_gallery_elem, :notice => "Blog Element successfully updated!")
    else
      render :action => 'edit'
    end
  end


  private
  def get_template
    if params[:id]
      @photo_gallery_elem = PhotoGalleryElem.find(params[:id])
      @node = @photo_gallery_elem.element.template.node
    end
    super
  end


end
