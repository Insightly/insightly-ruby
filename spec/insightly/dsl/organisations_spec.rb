require 'spec_helper'

describe Insightly2::DSL::Organisations do
  let(:organisation_id) { 39831139 }

  # GET /v2.1/Organisations/{id}
  describe '#get_organisation' do
    it 'returns an organisation' do
      VCR.use_cassette('get_organisation') do
        expect(Insightly2.client.get_organisation(id: organisation_id)).to be_a(Organisation)
      end
    end
  end

  # GET /v2.1/Organisations/{c_id}/Emails
  describe '#get_organisation_emails' do
    it 'returns organisation emails' do
      VCR.use_cassette('get_organisation_emails') do
        response = Insightly2.client.get_organisation_emails(id: organisation_id)
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Email)
      end
    end
  end

  # GET /v2.1/Organisations/{c_id}/Image
  # describe '#get_organisation_image' do
  #   it 'returns organisation image' do
  #     VCR.use_cassette('get_organisation_image') do
  #       response = Insightly2.client.get_organisation_image(id: organisation_id)
  #       #expect(response.status).to eq(200)
  #       # TODO - Insightly2 server error with default organisation image they should fix this.
  #     end
  #   end
  # end

  # GET /v2.1/Organisations/{c_id}/Notes
  describe '#get_organisation_notes' do
    it 'returns organisation notes' do
      VCR.use_cassette('get_organisation_notes') do
        response = Insightly2.client.get_organisation_notes(id: organisation_id)
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Note)
      end
    end
  end

  # GET /v2.1/Organisations/{c_id}/Tasks
  describe '#get_organisation_tasks' do
    it 'returns organisation tasks' do
      VCR.use_cassette('get_organisation_tasks') do
        response = Insightly2.client.get_organisation_tasks(id: organisation_id)
        expect(response).to be_a(Array)
        expect(response.first).to be_a(Task)
      end
    end
  end

  # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}
  describe '#get_organisations' do
    it 'returns an array of organisations' do
      VCR.use_cassette('get_organisations') do
        organisations = Insightly2.client.get_organisations
        expect(organisations).to be_a(Array)
        expect(organisations.first).to be_a(Organisation)
      end
    end
  end

  # POST /v2.1/Organisations
  describe '#create_organisation' do
    it 'creates and returns organisation' do
      VCR.use_cassette('create_organisation') do
        organisation = Insightly2.client.get_organisation(id: organisation_id)
        expect(Insightly2.client.create_organisation(organisation: organisation)).to be_a(Organisation)
      end
    end
  end

  # POST /v2.1/Organisations/{c_id}/Image/{filename}
  # describe '#create_organisation_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('create_organisation_image') do
  #       response = Insightly2.client.create_organisation_image(id: organisation_id, filename: '1.jpg')
  #       #expect(response.status).to eq(201)
  #       # TODO - Can't add image. Not sure why.
  #     end
  #   end
  # end

  # PUT /v2.1/Organisations
  describe '#update_organisation' do
    it 'updates and returns organisation' do
      VCR.use_cassette('update_organisation') do
        organisation = Insightly2.client.get_organisation(id: organisation_id)
        expect(Insightly2.client.update_organisation(organisation: organisation)).to be_a(Organisation)
      end
    end
  end

  # PUT /v2.1/Organisations/{c_id}/Image/{filename}
  # describe '#update_organisation_image' do
  #   it 'returns a response with code 201' do
  #     VCR.use_cassette('update_organisation_image') do
  #       response = Insightly2.client.update_organisation_image(id: organisation_id, filename: '1.jpg')
  #       #expect(response.status).to eq(201)
  #       # TODO - Can't update image. Not sure why.
  #     end
  #   end
  # end

  # DELETE /v2.1/Organisations/{id}
  describe '#delete_organisation' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_organisation') do
        response = Insightly2.client.delete_organisation(id: organisation_id)
        expect(response.status).to eq(202)
      end
    end
  end

  # DELETE /v2.1/Organisations/{c_id}/Image
  describe '#delete_organisation_image' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_organisation_image') do
        response = Insightly2.client.delete_organisation_image(id: organisation_id)
        expect(response.status).to eq(202)
      end
    end
  end
end