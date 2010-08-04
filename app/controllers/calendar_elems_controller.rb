class CalendarElemsController < ApplicationController
  before_filter :get_template
  
  def show
    @month = (params[:month] || Time.zone.now.month).to_i
    @year = (params[:year] || Time.zone.now.year).to_i
    @shown_month = Date.civil(@year, @month) 
    @event_strips = Event.event_strips_for_month(@shown_month)
  end

  def edit
    @element = @calendar_elem.element
  end

  def new
    @element = Element.new(:position => params[:position], :column_order => Element.set_highest_column_order(params[:position]))
    @calendar_elem = @element.elem = CalendarElem.new
  end

  def create
    @element = Element.new(:position => params[:position], :column_order => params[:column_order])
    @calendar_elem = @element.elem = CalendarElem.new(params[:calendar_elem])
    if @calendar_elem.save and @element.save and @node.template.elements << @element
      redirect_to calendar_elem_path(@calendar_elem, :notice => "Calendar Element successfully created.")
    else
      render :action => 'new'
    end
  end

  def update
    @element = @calendar_elem.element
    if @calendar_elem.update_attributes(params[:calendar_elem])
      redirect_to @calendar_elem, :notice => "Calendar Element successfully updated."
    else
      render :action => 'edit'
    end
  end


  private
  
  def get_template
    if params[:id]
      @calendar_elem = CalendarElem.find(params[:id])
      @node = @calendar_elem.element.template.node
    end
    super
  end


  
end
