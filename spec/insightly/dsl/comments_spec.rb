require 'spec_helper'

describe Insightly::DSL::Comments do
  # DELETE /v2.1/Comments/{id}
  describe '#delete_comment' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_comment(1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/Comments/{id}
  describe '#get_comment' do
    it 'returns a comment' do
      expect(Insightly.client.get_comment(1)).to be_a(Insightly::Resources::Comment)
    end
  end

  # POST /v2.1/Comments?c_id={c_id}&filename={filename}

  # PUT /v2.1/Comments

end