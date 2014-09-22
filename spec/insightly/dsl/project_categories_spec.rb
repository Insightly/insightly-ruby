require 'spec_helper'

describe Insightly::DSL::ProjectCategories do
  # DELETE /v2.1/ProjectCategories/{id}
  # @param [String, Fixnum] id A ProjectCategory's ID
  describe '#delete_project_category' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_project_category(1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/ProjectCategories
  # @return [<Insightly::Resources::ProjectCategory>, nil]
  describe '#get_project_categories' do
    it 'returns an array of project_categories' do
      project_categories = Insightly.client.get_project_categories
      expect(project_categories).to be_a(Array)
      expect(project_categories.first).to be_a(Insightly::Resources::ProjectCategory)
    end
  end

  # GET /v2.1/ProjectCategories/{id}
  # @return [Insightly::Resources::ProjectCategory]
  # @param [String, Fixnum] id A ProjectCategory's ID
  describe '#get_project_category' do
    it 'returns an project_category' do
      expect(Insightly.client.get_project_category(1)).to be_a(Insightly::Resources::ProjectCategory)
    end
  end

  # POST /v2.1/ProjectCategories

  # PUT /v2.1/ProjectCategories
end