require 'spec_helper'

describe Insightly2::DSL::ProjectCategories do
  let(:project_category_id) { 1947441 }

  # GET /v2.1/ProjectCategories/{id}
  describe '#get_project_category' do
    it 'returns an project_category' do
      VCR.use_cassette('get_project_category') do
        expect(Insightly2.client.get_project_category(id: project_category_id)).to be_a(ProjectCategory)
      end
    end
  end

  # GET /v2.1/ProjectCategories
  describe '#get_project_categories' do
    it 'returns an array of project_categories' do
      VCR.use_cassette('get_project_categories') do
        project_categories = Insightly2.client.get_project_categories
        expect(project_categories).to be_a(Array)
        expect(project_categories.first).to be_a(ProjectCategory)
      end
    end
  end

  # POST /v2.1/ProjectCategories
  describe '#create_project_category' do
    it 'creates and returns a project_category' do
      VCR.use_cassette('create_project_category') do
        project_category = Insightly2.client.get_project_category(id: project_category_id)
        expect(Insightly2.client.create_project_category(category: project_category)).to be_a(ProjectCategory)
      end
    end
  end

  # PUT /v2.1/ProjectCategories
  describe '#update_project_category' do
    it 'updates and returns a project_category' do
      VCR.use_cassette('update_project_category') do
        project_category = Insightly2.client.get_project_category(id: project_category_id)
        expect(Insightly2.client.update_project_category(category: project_category)).to be_a(ProjectCategory)
      end
    end
  end

  # DELETE /v2.1/ProjectCategories/{id}
  describe '#delete_project_category' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_project_category') do
        response = Insightly2.client.delete_project_category(id: project_category_id)
        expect(response.status).to eq(202)
      end
    end
  end
end