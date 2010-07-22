class TemplatesController < ApplicationController
  before_filter :get_template
  
  def show
    redirect_to admin_shortcut_path(params[:shortcut])
    #    redirect_to("new_text_elem".to_sym, :shortcut => params[:shortcut], :position => params[:position])
    @elements = @template.elements
  end

  def edit
    @elements = @template.elements
  end

  def new_element
    if request.post?
      redirect_to params[:elem_path].to_sym, :shortcut => params[:shortcut], :position => params[:position]
    else
      flash[:important_notice] = "Error in building a new element."
      redirect_to(:back)
    end
  end

  

end
