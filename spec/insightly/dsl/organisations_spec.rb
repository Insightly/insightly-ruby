require 'spec_helper'

describe Insightly::DSL::Organisations do
  # DELETE /v2.1/Organisations/{c_id}/Image

  # DELETE /v2.1/Organisations/{id}
  describe '#delete_organisation' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_organisation(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Organisations/{c_id}/Emails

  # GET /v2.1/Organisations/{c_id}/Image

  # GET /v2.1/Organisations/{c_id}/Notes

  # GET /v2.1/Organisations/{c_id}/Tasks

  # GET /v2.1/Organisations/{id}
  describe '#get_organisation' do
    it 'returns an organisation' do
      expect(Insightly.client.get_organisation(1)).to be_a(Insightly::Resources::Organisation)
    end
  end

  # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}

  # POST /v2.1/Organisations

  # POST /v2.1/Organisations/{c_id}/Image/{filename}

  # PUT /v2.1/Organisations

  # PUT /v2.1/Organisations/{c_id}/Image/{filename}
end