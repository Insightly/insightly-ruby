require 'spec_helper'

describe Insightly::DSL::Teams do
  # DELETE /v2.1/Teams/{id}

  # GET /v2.1/Teams

  # GET /v2.1/Teams/{id}
  describe '#get_team' do
    it 'returns a team' do
      expect(Insightly.client.get_team(1)).to be_a(Insightly::Resources::Team)
    end
  end

  # POST /v2.1/Teams

  # PUT /v2.1/Teams
end