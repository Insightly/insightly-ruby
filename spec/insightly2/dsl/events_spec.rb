require 'spec_helper'

describe Insightly2::DSL::Events do
  let(:event_id) { 2402366 }

  # GET /v2.1/Events/{id}
  describe '#get_event' do
    it 'returns an event' do
      VCR.use_cassette('get_event') do
        expect(Insightly2.client.get_event(id: event_id)).to be_a(Event)
      end
    end
  end

  # GET /v2.1/Events
  describe '#get_events' do
    it 'returns an array of events' do
      VCR.use_cassette('get_events') do
        events = Insightly2.client.get_events
        expect(events).to be_a(Array)
        expect(events.first).to be_a(Event)
      end
    end
  end

  # POST /v2.1/Events
  describe '#create_event' do
    it 'creates and returns event' do
      VCR.use_cassette('create_event') do
        event = Insightly2.client.get_event(id: event_id)
        expect(Insightly2.client.create_event(event: event)).to be_a(Event)
      end
    end
  end

  # PUT /v2.1/Events
  describe '#update_event' do
    it 'updates and returns event' do
      VCR.use_cassette('update_event') do
        event = Insightly2.client.get_event(id: event_id)
        expect(Insightly2.client.update_event(event: event)).to be_a(Event)
      end
    end
  end

  # DELETE /v2.1/Events/{id}
  describe '#delete_event' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_event') do
        response = Insightly2.client.delete_event(id: event_id)
        expect(response.status).to eq(202)
      end
    end
  end
end