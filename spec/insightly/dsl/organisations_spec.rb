require 'spec_helper'

describe Insightly::DSL::Organisations do
  # GET /v2.1/Organisations/{id}
  describe '#get_organisation' do
    it 'returns an organisation' do
      expect(Insightly.client.get_organisation(id: 1)).to be_a(Organisation)
    end
  end

  # GET /v2.1/Organisations/{c_id}/Emails
  describe '#get_organisation_emails' do
    it 'returns organisation emails' do
      response = Insightly.client.get_organisation_emails(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Email)
    end
  end

  # GET /v2.1/Organisations/{c_id}/Image
  describe '#get_organisation_image' do
    xit 'returns organisation image' do
      response = Insightly.client.get_organisation_image(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Organisation)
    end
  end

  # GET /v2.1/Organisations/{c_id}/Notes
  describe '#get_organisation_notes' do
    it 'returns organisation notes' do
      response = Insightly.client.get_organisation_notes(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Note)
    end
  end

  # GET /v2.1/Organisations/{c_id}/Tasks
  describe '#get_organisation_tasks' do
    it 'returns organisation tasks' do
      response = Insightly.client.get_organisation_tasks(id: 1)
      expect(response).to be_a(Array)
      expect(response.first).to be_a(Task)
    end
  end

  # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}
  describe '#get_organisations' do
    xit 'returns an array of organisations' do
      organisations = Insightly.client.get_organisations
      expect(organisations).to be_a(Array)
      expect(organisations.first).to be_a(Organisation)
    end
  end

  # POST /v2.1/Organisations
  describe '#create_organisation' do
    it 'creates and returns organisation' do
      expect(Insightly.client.create_organisation(organisation: {organisation_name: ''})).to be_a(Organisation)
    end
  end

  # POST /v2.1/Organisations/{c_id}/Image/{filename}
  describe '#create_organisation_image' do
    xit 'returns 201' do
      response = Insightly.client.create_organisation_image(id: 1, filename: '')
      expect(response.code).to eq(201)
    end
  end

  # PUT /v2.1/Organisations
  describe '#update_organisation' do
    it 'updates and returns organisation' do
      expect(Insightly.client.update_organisation(organisation: {id: 1})).to be_a(Organisation)
    end
  end

  # PUT /v2.1/Organisations/{c_id}/Image/{filename}
  describe '#update_organisation_image' do
    xit 'returns 201' do
      response = Insightly.client.update_organisation_image(id: 1, filename: '')
      expect(response.code).to eq(201)
    end
  end

  # DELETE /v2.1/Organisations/{id}
  describe '#delete_organisation' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_organisation(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # DELETE /v2.1/Organisations/{c_id}/Image
  describe '#delete_organisation_image' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_organisation_image(id: 1)
      expect(response.code).to eq(202)
    end
  end
end