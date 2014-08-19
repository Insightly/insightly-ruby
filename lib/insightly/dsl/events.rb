require 'insightly/dsl'

module Insightly
  module DSL::Events
    # DELETE /v2.1/Events/{id}
    # @param [String, Fixnum] id A Event's ID
    def delete_event(id)
      request(:delete, "Events/#{id}")
    end

    # GET /v2.1/Events
    # @return [<Insightly::Resources::Event>, nil]
    def get_events
      Resources::Event.parse(request(:get, 'Events'))
    end

    # GET /v2.1/Events/{id}
    # @return [Insightly::Resources::Event]
    # @param [String, Fixnum] id A Event's ID
    def get_event(id)
      Resources::Event.parse(request(:get, "Events/#{id}"))
    end

    # POST /v2.1/Events

    # PUT /v2.1/Events
  end
end
