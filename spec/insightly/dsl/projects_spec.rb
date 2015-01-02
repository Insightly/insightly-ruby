require 'spec_helper'

describe Insightly2::DSL::Projects do
  let(:project_id) { 1657941 }

  # GET /v2.1/Projects/{id}
  describe '#get_project' do
    it 'returns a project' do
      VCR.use_cassette('get_project') do
        expect(Insightly2.client.get_project(id: project_id)).to be_a(Project)
      end
    end
  end

  # GET /v2.1/Projects/{c_id}/Emails
  describe '#get_project_emails' do
    it 'returns project emails' do
      VCR.use_cassette('get_project_emails') do
        response = Insightly2.client.get_project_emails(id: project_id)
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Email)
      end
    end
  end

  # GET /v2.1/Projects/{c_id}/Image
  # describe '#get_project_image' do
  #   it 'returns project image' do
  #     VCR.use_cassette('get_project_image') do
  #       response = Insightly2.client.get_project_image(id: project_id)
  #       # expect(response.status).to eq(200)
  #       # TODO - Insightly2 server error with default project image they should fix this.
  #     end
  #   end
  # end

  # GET /v2.1/Projects/{c_id}/Notes
  describe '#get_project_notes' do
    it 'returns project notes' do
      VCR.use_cassette('get_project_notes') do
        response = Insightly2.client.get_project_notes(id: project_id)
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Note)
      end
    end
  end

  # GET /v2.1/Projects/{c_id}/Tasks
  describe '#get_project_tasks' do
    it 'returns project tasks' do
      VCR.use_cassette('get_project_tasks') do
        response = Insightly2.client.get_project_tasks(id: project_id)
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Task)
      end
    end
  end

  # GET /v2.1/Projects?ids={ids}&tag={tag}
  describe '#get_projects' do
    it 'returns an array of projects' do
      VCR.use_cassette('get_projects') do
        projects = Insightly2.client.get_projects
        expect(projects).to be_a(Array)
        expect(projects.first).to be_a(Project)
      end
    end
  end

  # POST /v2.1/Projects
  describe '#create_project' do
    it 'creates and returns a project' do
      VCR.use_cassette('create_project') do
        project = Insightly2.client.get_project(id: project_id)
        expect(Insightly2.client.create_project(project: project)).to be_a(Project)
      end
    end
  end

  # POST /v2.1/Projects/{c_id}/Image/{filename}
  # describe '#create_project_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('create_project_image') do
  #       response = Insightly2.client.create_project_image(id: project_id, filename: '1.jpg')
  #       # expect(response.status).to eq(201)
  #       # TODO - Can't add image. Not sure why.
  #     end
  #   end
  # end

  # PUT /v2.1/Projects
  describe '#update_project' do
    it 'updates and returns a project' do
      VCR.use_cassette('update_project') do
        project = Insightly2.client.get_project(id: project_id)
        expect(Insightly2.client.update_project(project: project)).to be_a(Project)
      end
    end
  end

  # PUT /v2.1/Projects/{c_id}/Image/{filename}
  # describe '#update_project_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('update_project_image') do
  #       response = Insightly2.client.update_project_image(id: project_id, filename: '1.jpg')
  #       # expect(response.status).to eq(201)
  #       # TODO - Can't update image. Not sure why.
  #     end
  #   end
  # end

  # DELETE /v2.1/Projects/{id}
  describe '#delete_project' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_project') do
        response = Insightly2.client.delete_project(id: project_id)
        expect(response.status).to eq(202)
      end
    end
  end

  # DELETE /v2.1/Projects/{c_id}/Image
  describe '#delete_project_image' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_project_image') do
        response = Insightly2.client.delete_project_image(id: project_id)
        expect(response.status).to eq(202)
      end
    end
  end
end