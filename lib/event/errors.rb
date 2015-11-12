module Event
  # Raised if an event name cannot be resolved
  class EventNameResolveError < StandardError; end
  class NoEventError < StandardError; end
end
