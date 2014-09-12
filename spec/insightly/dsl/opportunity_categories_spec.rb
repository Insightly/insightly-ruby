require 'spec_helper'

describe Insightly::DSL::OpportunityCategories do
  # DELETE /v2.1/OpportunityCategories/{id}

  # GET /v2.1/OpportunityCategories

  # GET /v2.1/OpportunityCategories/{id}
  describe '#get_opportunity_category' do
    it 'returns an opportunity category' do
      expect(Insightly.client.get_opportunity_category(1)).to be_a(Insightly::Resources::OpportunityCategory)
    end
  end

  # POST /v2.1/OpportunityCategories

  # PUT /v2.1/OpportunityCategories
end