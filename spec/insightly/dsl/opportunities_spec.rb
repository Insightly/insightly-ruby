require 'spec_helper'

describe Insightly::DSL::Opportunities do
  # DELETE /v2.1/Opportunities/{c_id}/Image

  # DELETE /v2.1/Opportunities/{id}
  describe '#delete_opportunity' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_opportunity(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Opportunities/{c_id}/Emails

  # GET /v2.1/Opportunities/{c_id}/Image

  # GET /v2.1/Opportunities/{c_id}/Notes

  # GET /v2.1/Opportunities/{c_id}/StateHistory

  # GET /v2.1/Opportunities/{c_id}/Tasks

  # GET /v2.1/Opportunities/{id}
  describe '#get_opportunity' do
    it 'returns an opportunity' do
      expect(Insightly.client.get_opportunity(1)).to be_a(Insightly::Resources::Opportunity)
    end
  end

  # GET /v2.1/Opportunities?ids={ids}&tag={tag}

  # POST /v2.1/Opportunities

  # POST /v2.1/Opportunities/{c_id}/Image/{filename}

  # PUT /v2.1/Opportunities

  # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
end