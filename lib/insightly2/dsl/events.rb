require 'insightly2/dsl'

module Insightly2
  module DSL::Events
    # GET /v2.1/Events/{id}
    # Get an event.
    # @param [String, Fixnum] id An event's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Event, nil].
    def get_event(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Event.parse(request(:get, "Events/#{id}"))
    end

    # GET /v2.1/Events
    # Get a list of events.
    # @return [Insightly2::Resources::Event, nil]
    def get_events
      Resources::Event.parse(request(:get, "Events"))
    end

    # POST /v2.1/Events
    # Create an event.
    # @param [Hash] event The event to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Event, nil]
    def create_event(event: nil)
      raise ArgumentError, "Event cannot be blank" if event.blank?
      Resources::Event.parse(request(:post, "Events", event))
    end

    # PUT /v2.1/Events
    # Update an event.
    # @param [Hash] event The event to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Event, nil]
    def update_event(event: nil)
      raise ArgumentError, "Event cannot be blank" if event.blank?
      Resources::Event.parse(request(:put, "Events", event))
    end

    # DELETE /v2.1/Events/{id}
    # Delete an event.
    # @param [String, Fixnum] id An event's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_event(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "Events/#{id}")
    end
  end
end
