require 'spec_helper'

describe Insightly::DSL::Events do
  # GET /v2.1/Events/{id}
  describe '#get_event' do
    it 'returns an event' do
      expect(Insightly.client.get_event(id: 1)).to be_a(Event)
    end
  end

  # GET /v2.1/Events
  describe '#get_events' do
    it 'returns an array of events' do
      events = Insightly.client.get_events
      expect(events).to be_a(Array)
      expect(events.first).to be_a(Event)
    end
  end

  # POST /v2.1/Events
  describe '#create_event' do
    xit 'creates and returns event' do
      expect(Insightly.client.create_event(event: {})).to be_a(Event)
    end
  end

  # PUT /v2.1/Events
  describe '#update_event' do
    xit 'updates and returns event' do
      expect(Insightly.client.update_event(event: {id: 1})).to be_a(Event)
    end
  end

  # DELETE /v2.1/Events/{id}
  describe '#delete_event' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_event(id: 1)
      expect(response.code).to eq(202)
    end
  end
end