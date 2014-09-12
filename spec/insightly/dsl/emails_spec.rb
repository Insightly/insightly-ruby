require 'spec_helper'

describe Insightly::DSL::Emails do
  # DELETE /v2.1/Emails/{id}
  describe '#delete_email' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_email(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Emails/{c_id}/Comments

  # GET /v2.1/Emails/{id}

  # GET /v2.1/Emails?ids={ids}&tag={tag}

  # POST /v2.1/Emails/{c_id}/Comments
end