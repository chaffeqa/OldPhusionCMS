module CalendarElemsHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
  # custom options for this calendar
  def event_calendar_opts(calendar_elem)
    yr = ( @year ? @year : Time.zone.now.year).to_i
    mnth = ( @month ? @month : Time.zone.now.month).to_i
    shown_month = ( @shown_month ? @shown_month : Date.civil( yr, mnth ))
    event_strips = ( @event_strips ? @event_strips : Event.event_strips_for_month(shown_month))
    return {
      :year => yr,
      :month => mnth,
      :event_strips => event_strips,
      :month_name_text => I18n.localize(shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(shown_month.prev_month),
      :next_month_text => month_link(shown_month.next_month) + " >>",
      :use_all_day => true
    }
  end

  def event_calendar(calendar_elem)
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts(calendar_elem) do |args|
      event, day = args[:event], args[:day]
      html = %(<a href="#{calendar_elem_event_path(event.calendar_elem, event.id)}" title="#{h(event.name)}">)
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end
end
