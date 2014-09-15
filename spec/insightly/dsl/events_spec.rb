require 'spec_helper'

describe Insightly::DSL::Events do
  # DELETE /v2.1/Events/{id}
  describe '#delete_event' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_event(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Events
  describe '#get_events' do
    it 'returns an array of events' do
      events = Insightly.client.get_events
      expect(events).to be_a(Array)
      expect(events.first).to be_a(Insightly::Resources::Event)
    end
  end
  
  # GET /v2.1/Events/{id}
  describe '#get_event' do
    it 'returns an event' do
      expect(Insightly.client.get_event(1)).to be_a(Insightly::Resources::Event)
    end
  end

  # POST /v2.1/Events

  # PUT /v2.1/Events
end