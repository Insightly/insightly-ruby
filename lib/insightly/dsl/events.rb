require 'insightly/dsl'

module Insightly
  module DSL::Events
    # GET /v2.1/Events/{id}
    # Get an event.
    # @param [String, Fixnum] id An event's ID.
    # @return [Insightly::Resources::Event, nil].
    def get_event(id:)
      Resources::Event.parse(request(:get, "Events/#{id}"))
    end

    # GET /v2.1/Events
    # Get a list of events.
    # @return [Insightly::Resources::Event, nil]
    def get_events
      Resources::Event.parse(request(:get, "Events"))
    end

    # POST /v2.1/Events
    # Create an event.
    # @param [Hash] event The event to create.
    # @return [Insightly::Resources::Event, nil]
    def create_event(event:)
       Resources::Event.parse(request(:post, "Events", event))
    end

    # PUT /v2.1/Events
    # Update an event.
    # @param [Hash] event The event to update.
    # @return [Insightly::Resources::Event, nil]
    def update_event(event:)
       Resources::Event.parse(request(:put, "Events", event))
    end

    # DELETE /v2.1/Events/{id}
    # Delete an event.
    # @param [String, Fixnum] id An event's ID.
    # @return [RestClient::Response].
    def delete_event(id:)
      request(:delete, "Events/#{id}")
    end
  end
end
