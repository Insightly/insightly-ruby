require 'spec_helper'

describe Insightly2::DSL::LeadStatuses do
  # GET /v2.1/LeadStatuses
  describe '#get_lead_status' do
    it 'returns an array of lead statuses' do
      VCR.use_cassette('get_lead_statuses') do
        lead_statuses = Insightly2.client.get_lead_statuses
        expect(lead_statuses).to be_a(Array)
        expect(lead_statuses.first).to be_a(LeadStatus)
      end
    end
  end

  # POST /v2.1/LeadStatuses
  describe '#create_lead_status' do
    it 'creates and returns a lead status' do
      VCR.use_cassette('create_lead_status') do
        lead_status = Insightly2.client.get_lead_statuses.first
        expect(Insightly2.client.create_lead_status(lead_status: lead_status)).to be_a(LeadStatus)
      end
    end
  end

  # PUT /v2.1/LeadStatuses
  describe '#update_lead_status' do
    it 'updates and returns a lead status' do
      VCR.use_cassette('update_lead_status') do
        lead_status = Insightly2.client.get_lead_statuses.first
        expect(Insightly2.client.update_lead_status(lead_status: lead_status)).to be_a(LeadStatus)
      end
    end
  end

  # DELETE /v2.1/LeadStatuses/{id}
  describe '#delete_lead_status' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_lead_status') do
        lead_status = Insightly2.client.get_lead_statuses.first
        response = Insightly2.client.delete_lead_status(id: lead_status.lead_status_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
