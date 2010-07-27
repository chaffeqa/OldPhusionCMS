class TemplatesController < ApplicationController
  before_filter :get_template
  
  def show
    redirect_to admin_shortcut_path(params[:shortcut])
  end

  def edit
  end

  
  def new_element
    if request.post?
      respond_to do |format|
        format.html { redirect_to(:controller => params[:elem_controller], :action => 'new', :shortcut => params[:shortcut], :position => params[:position]) }
        format.js { redirect_to(:controller => params[:elem_controller], :action => 'new', :shortcut => params[:shortcut], :position => params[:position], :format => :js) }
      end
    else
      flash[:important_notice] = "Error in building a new element."
      redirect_to(:back)
    end 
  end
  

end
