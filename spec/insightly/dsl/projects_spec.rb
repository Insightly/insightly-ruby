require 'spec_helper'

describe Insightly::DSL::Projects do
  # DELETE /v2.1/Projects/{c_id}/Image
  describe '#delete_project_image' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_project_image(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # DELETE /v2.1/Projects/{id}
  describe '#delete_project' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_project(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/Projects/{c_id}/Emails
  describe '#get_project_emails' do
    it 'returns project emails' do
      response = Insightly.client.get_project_emails(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Insightly::Resources::Project)
    end
  end

  # GET /v2.1/Projects/{c_id}/Image
  describe '#get_project_image' do
    it 'returns project image' do
      response = Insightly.client.get_project_image(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Insightly::Resources::Project)
    end
  end

  # GET /v2.1/Projects/{c_id}/Notes
  describe '#get_project_notes' do
    it 'returns project notes' do
      response = Insightly.client.get_project_notes(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Insightly::Resources::Project)
    end
  end

  # GET /v2.1/Projects/{c_id}/Tasks
  describe '#get_project_tasks' do
    it 'returns project tasks' do
      response = Insightly.client.get_project_tasks(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Insightly::Resources::Project)
    end
  end

  # GET /v2.1/Projects/{id}
  describe '#get_project' do
    it 'returns a project' do
      expect(Insightly.client.get_project(id: 1)).to be_a(Insightly::Resources::Project)
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
  describe '#create_project' do
    it 'creates and returns a project' do
      expect(Insightly.client.create_project(project: {})).to be_a(Insightly::Resources::Project)
    end
  end

  # POST /v2.1/Projects/{c_id}/Image/{filename}
  describe '#create_project_image' do
    xit 'returns 201' do
      response = Insightly.client.create_project_image(id: 1, filename: '')
    end
  end

  # PUT /v2.1/Projects
  describe '#update_project' do
    it 'updates and returns a project' do
      expect(Insightly.client.update_project(project: {})).to be_a(Insightly::Resources::Project)
    end
  end

  # PUT /v2.1/Projects/{c_id}/Image/{filename}
  describe '#update_project_image' do
    xit 'returns 201' do
      response = Insightly.client.update_project_image(id: 1, filename: '')
    end
  end
end