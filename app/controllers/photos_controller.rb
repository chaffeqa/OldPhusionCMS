class PhotosController < ApplicationController
  before_filter :get_template


  def new
    @photo = Photo.new
  end


  def edit
    @photo = Photo.find(params[:id])
  end


  def create
    @photo = Photo.new(params[:photo])
    if @photo.save and @photo_gallery_elem.photos << @photo
      redirect_to(@photo_gallery_elem, :notice => 'Photo was successfully added.')
    else
      render :action => "new"
    end
  end


  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to(@photo_gallery_elem, :notice => 'Photo was successfully updated.')
    else
      render :action => "edit"
    end
  end


  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photo_gallery_elem_url(@photo_gallery_elem), :notice => 'Photo was successfully destroyed.')
  end


  private
  def get_template
    if params[:photo_gallery_elem_id]
      @photo_gallery_elem = PhotoGalleryElem.find(params[:photo_gallery_elem_id])
      @node = @photo_gallery_elem.element.template.node
    end
    super
  end

end
