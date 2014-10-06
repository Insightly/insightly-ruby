require 'spec_helper'

describe Insightly::DSL::OpportunityCategories do
  let(:opportunity_category_id) { 2175382 }

  # GET /v2.1/OpportunityCategories/{id}
  describe '#get_opportunity_category' do
    it 'returns an opportunity category' do
      VCR.use_cassette('get_opportunity_category') do
        expect(Insightly.client.get_opportunity_category(id: opportunity_category_id)).to be_a(OpportunityCategory)
      end
    end
  end

  # GET /v2.1/OpportunityCategories
  describe '#get_opportunity_categories' do
    it 'returns an array of opportunity_categories' do
      VCR.use_cassette('get_opportunity_categories') do
        opportunity_categories = Insightly.client.get_opportunity_categories
        expect(opportunity_categories).to be_a(Array)
        expect(opportunity_categories.first).to be_a(OpportunityCategory)
      end
    end
  end

  # POST /v2.1/OpportunityCategories
  describe '#create_opportunity_category' do
    it 'creates and returns an opportunity category' do
      VCR.use_cassette('create_opportunity_category') do
        opportunity_category = Insightly.client.get_opportunity_category(id: opportunity_category_id)
        expect(Insightly.client.create_opportunity_category(category: opportunity_category)).to be_a(OpportunityCategory)
      end
    end
  end

  # PUT /v2.1/OpportunityCategories
  describe '#update_opportunity_category' do
    it 'updates and returns an opportunity category' do
      VCR.use_cassette('update_opportunity_category') do
        opportunity_category = Insightly.client.get_opportunity_category(id: opportunity_category_id)
        expect(Insightly.client.update_opportunity_category(category: opportunity_category)).to be_a(OpportunityCategory)
      end
    end
  end

  # DELETE /v2.1/OpportunityCategories/{id}
  describe '#delete_opportunity_category' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_opportunity_category') do
        response = Insightly.client.delete_opportunity_category(id: opportunity_category_id)
        expect(response.status).to eq(202)
      end
    end
  end
end