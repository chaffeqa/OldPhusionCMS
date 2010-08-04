class EventsController < ApplicationController
  before_filter :get_template


  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new(:color => @calendar_elem.event_color)
  end


  def edit
    @event = Event.find(params[:id])
  end


  def create
    @event = Event.new(params[:event])
    if @event.save and @calendar_elem.events << @event
      redirect_to(@calendar_elem, :notice => 'Event was successfully added.')
    else
      render :action => "new"
    end
  end


  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to(@calendar_elem, :notice => 'Event was successfully updated.')
    else
      render :action => "edit"
    end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(calendar_elem_url(@calendar_elem), :notice => 'Event was successfully destroyed.')
  end




  private
  def get_template
    if params[:calendar_elem_id]
      @calendar_elem = CalendarElem.find(params[:calendar_elem_id])
      @node = @calendar_elem.element.template.node
    end
    super
  end

end
