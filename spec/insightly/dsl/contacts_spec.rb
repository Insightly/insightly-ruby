require 'spec_helper'

describe Insightly::DSL::Contacts do
  # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
  describe '#get_contacts' do
    xit 'returns an array of contacts' do
      contacts = Insightly.client.get_contacts
      expect(contacts).to be_a(Array)
      expect(contacts.first).to be_a(Insightly::Resources::Contact)
    end
  end

  # GET /v2.1/Contacts/{id}
  describe '#get_contact' do
    it 'returns a contact' do
      expect(Insightly.client.get_contact(id: 1)).to be_a(Insightly::Resources::Contact)
    end
  end

  # POST /v2.1/Contacts
  describe '#create_contact' do
    xit 'creates and returns contact' do
      expect(Insightly.client.create_contact(contact: {})).to be_a(Insightly::Resources::Contact)
    end
  end

  # PUT /v2.1/Contacts
  describe '#update_contact' do
    xit 'updates and returns contact' do
      expect(Insightly.client.update_contact(contact: {})).to be_a(Insightly::Resources::Contact)
    end
  end

  # DELETE /v2.1/Contacts/{id}
  describe '#delete_contact' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_contact(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/Contacts/{c_id}/Emails
  describe '#get_contact_emails' do
    it 'returns a contact with emails' do
      emails = Insightly.client.get_contact_emails(id: 1)
      expect(emails).to be_a(Array)
      expect(emails.first).to be_a(Insightly::Resources::Contact)
    end
  end

  # GET /v2.1/Contacts/{c_id}/Notes
  describe '#get_contact_notes' do
    it 'returns a contact with notes' do
      notes = Insightly.client.get_contact_notes(id: 1)
      expect(notes).to be_a(Array)
      expect(notes.first).to be_a(Insightly::Resources::Contact)
    end
  end

  # GET /v2.1/Contacts/{c_id}/Tasks
  describe '#get_contact_tasks' do
    it 'returns a contact with tasks' do
      tasks = Insightly.client.get_contact_tasks(id: 1)
      expect(tasks).to be_a(Array)
      expect(tasks.first).to be_a(Insightly::Resources::Contact)
    end
  end

  # GET /v2.1/Contacts/{c_id}/Image
  describe '#get_contact_image' do
    it 'returns a contact with image' do
      expect(Insightly.client.get_contact_image(id: 1)).to be_a(Insightly::Resources::Contact)
    end
  end

  # POST /v2.1/Contacts/{c_id}/Image/{filename}
  describe '#add_contact_image' do
    xit 'returns 201' do
      response = Insightly.client.add_contact_image(id: 1, filename: '')
      expect(response.code).to eq(201)
    end
  end

  # PUT /v2.1/Contacts/{c_id}/Image/{filename}
  describe '#update_contact_image' do
    xit 'returns 201' do
      response = Insightly.client.update_contact_image(id: 1, filename: '')
      expect(response.code).to eq(201)
    end
  end

  # DELETE /v2.1/Contacts/{c_id}/Image
  describe '#delete_contact_image' do
    it 'returns 202' do
      response = Insightly.client.delete_contact_image(id: 1)
      expect(response.code).to eq(202)
    end
  end
end
