require 'spec_helper'

describe Insightly::DSL::Projects do
  # DELETE /v2.1/Projects/{c_id}/Image

  # DELETE /v2.1/Projects/{id}
  describe '#delete_project' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_project(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Projects/{c_id}/Emails

  # GET /v2.1/Projects/{c_id}/Image

  # GET /v2.1/Projects/{c_id}/Notes

  # GET /v2.1/Projects/{c_id}/Tasks

  # GET /v2.1/Projects/{id}
  describe '#get_project' do
    it 'returns a project' do
      expect(Insightly.client.get_project(1)).to be_a(Insightly::Resources::Project)
    end
  end

  # GET /v2.1/Projects?ids={ids}&tag={tag}
  describe '#get_projects' do
    it 'returns an array of projects' do
      projects = Insightly.client.get_projects
      expect(projects).to be_a(Array)
      expect(projects.first).to be_a(Insightly::Resources::Project)
    end
  end
  
  # POST /v2.1/Projects

  # POST /v2.1/Projects/{c_id}/Image/{filename}

  # PUT /v2.1/Projects

  # PUT /v2.1/Projects/{c_id}/Image/{filename}
end