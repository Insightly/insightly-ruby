require 'spec_helper'

describe Insightly::DSL::OpportunityCategories do
  # GET /v2.1/OpportunityCategories/{id}
  describe '#get_opportunity_category' do
    it 'returns an opportunity category' do
      expect(Insightly.client.get_opportunity_category(id: 1)).to be_a(OpportunityCategory)
    end
  end

  # GET /v2.1/OpportunityCategories
  describe '#get_opportunity_categories' do
    it 'returns an array of opportunity_categories' do
      opportunity_categories = Insightly.client.get_opportunity_categories
      expect(opportunity_categories).to be_a(Array)
      expect(opportunity_categories.first).to be_a(OpportunityCategory)
    end
  end

  # POST /v2.1/OpportunityCategories
  describe '#create_opportunity_category' do
    it 'creates and returns an opportunity category' do
      expect(Insightly.client.create_opportunity_category(category: {category_name: ''})).to be_a(OpportunityCategory)
    end
  end

  # PUT /v2.1/OpportunityCategories
  describe '#update_opportunity_category' do
    it 'updates and returns an opportunity category' do
      expect(Insightly.client.update_opportunity_category(category: {id: 1})).to be_a(OpportunityCategory)
    end
  end

  # DELETE /v2.1/OpportunityCategories/{id}
  describe '#delete_opportunity_category' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_opportunity_category(id: 1)
      expect(response.status).to eq(202)
    end
  end
end