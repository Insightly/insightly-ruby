require 'spec_helper'

describe Insightly2::DSL::Leads do
  let(:lead_id) { 7246484 }

  # GET /v2.1/Leads/{id}
  describe '#get_lead' do
    it 'returns a lead' do
      VCR.use_cassette('get_lead') do
        expect(Insightly2.client.get_lead(id: lead_id)).to be_a(Lead)
      end
    end
  end

  # POST /v2.1/Leads
  describe '#create_lead' do
    it 'creates and returns a lead' do
      VCR.use_cassette('create_lead') do
        lead = Insightly2.client.get_lead(id: lead_id)
        expect(Insightly2.client.create_lead(lead: lead)).to be_a(Lead)
      end
    end
  end

  # PUT /v2.1/Leads
  describe '#update_lead' do
    it 'updates and returns a lead' do
      VCR.use_cassette('update_lead') do
        lead = Insightly2.client.get_lead(id: lead_id)
        expect(Insightly2.client.update_lead(lead: lead)).to be_a(Lead)
      end
    end
  end

  # DELETE /v2.1/Lead/{id}
  describe '#delete_lead' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_lead') do
        response = Insightly2.client.delete_lead(id: lead_id)
        expect(response.status).to eq(202)
      end
    end
  end

  # GET /v2.1/Leads
  describe '#get_leads' do
    it 'returns an array of leads' do
      VCR.use_cassette('get_leads') do
        leads = Insightly2.client.get_leads
        expect(leads).to be_a(Array)
        expect(leads.first).to be_a(Lead)
      end
    end
  end
end
