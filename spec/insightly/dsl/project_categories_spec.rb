require 'spec_helper'

describe Insightly::DSL::ProjectCategories do
  # GET /v2.1/ProjectCategories/{id}
  describe '#get_project_category' do
    it 'returns an project_category' do
      expect(Insightly.client.get_project_category(id: 1)).to be_a(ProjectCategory)
    end
  end

  # GET /v2.1/ProjectCategories
  describe '#get_project_categories' do
    it 'returns an array of project_categories' do
      project_categories = Insightly.client.get_project_categories
      expect(project_categories).to be_a(Array)
      expect(project_categories.first).to be_a(ProjectCategory)
    end
  end

  # POST /v2.1/ProjectCategories
  describe '#create_project_category' do
    it 'creates and returns a project_category' do
      expect(Insightly.client.create_project_category(category: {category_name: ''})).to be_a(ProjectCategory)
    end
  end

  # PUT /v2.1/ProjectCategories
  describe '#update_project_category' do
    it 'updates and returns a project_category' do
      expect(Insightly.client.update_project_category(category: {id: 1})).to be_a(ProjectCategory)
    end
  end

  # DELETE /v2.1/ProjectCategories/{id}
  describe '#delete_project_category' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_project_category(id: 1)
      expect(response.status).to eq(202)
    end
  end
end