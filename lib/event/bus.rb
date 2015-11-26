require 'event/name_resolver'
require 'event/errors'

module Event
  # Event bus
  #
  # Implements and in-process pub-sub events broadcaster allowing multiple observers
  # to subscribe to different events that fire as your tests are executed.
  #
  class Bus
    def initialize(resolver)
      @resolver = resolver
      @handlers = Hash.new { |h, k| h[k] = [] }
    end

    # Register for an event
    def register(event_id, handler_object = nil, &handler_proc)
      handler = handler_proc || handler_object

      fail ArgumentError, 'Please pass either an object#call or a handler block' if handler.nil? || !handler.respond_to?(:call)

      Array(event_ids).flatten.each do |id|
        event_class = @resolver.transform(id)

        fail EventNameResolveError, %(Transforming "#{id}" into an event name failed for unknown reason.) if event_class.nil?
        @handlers[event_class.to_s] << handler
      end

      nil
    end

    # Broadcast an event
    def notify(event)
      fail NoEventError, 'Please pass an event object, not a class' if event.is_a?(Class)

      @handlers[event.class.to_s].each { |handler| handler.call(event) }
    end
  end
end
