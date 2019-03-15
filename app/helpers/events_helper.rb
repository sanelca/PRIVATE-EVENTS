module EventsHelper
  def upcoming_event?(event)
    Event.upcoming.include? event
  end
end
