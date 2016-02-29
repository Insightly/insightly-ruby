require 'spec_helper'

describe Insightly2::DSL::LeadSources do
  # GET /v2.1/LeadSources
  describe '#get_lead_sources' do
    it 'returns an array of lead sources' do
      VCR.use_cassette('get_lead_sources') do
        lead_sources = Insightly2.client.get_lead_sources
        expect(lead_sources).to be_a(Array)
        expect(lead_sources.first).to be_a(LeadSource)
      end
    end
  end

  # POST /v2.1/LeadSources
  describe '#create_lead_source' do
    it 'creates and returns a lead source' do
      VCR.use_cassette('create_lead_source') do
        lead_source = Insightly2.client.get_lead_sources.first
        expect(Insightly2.client.create_lead_source(lead_source: lead_source)).to be_a(LeadSource)
      end
    end
  end

  # PUT /v2.1/LeadSources
  describe '#update_lead_source' do
    it 'updates and returns a lead source' do
      VCR.use_cassette('update_lead_source') do
        lead_source = Insightly2.client.get_lead_sources.last
        expect(Insightly2.client.update_lead_source(lead_source: lead_source)).to be_a(LeadSource)
      end
    end
  end

  # DELETE /v2.1/LeadSources/{id}
  describe '#delete_lead_source' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_lead_source') do
        lead_source = Insightly2.client.get_lead_sources.last
        response = Insightly2.client.delete_lead_source(id: lead_source.lead_source_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
