require 'spec_helper'

describe Insightly::DSL::Contacts do
  # DELETE /v2.1/Contacts/{c_id}/Image

  # DELETE /v2.1/Contacts/{id}
  describe '#delete_contact' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_contact(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Contacts/{c_id}/Emails

  # GET /v2.1/Contacts/{c_id}/Image

  # GET /v2.1/Contacts/{c_id}/Notes

  # GET /v2.1/Contacts/{c_id}/Tasks

  # GET /v2.1/Contacts/{id}
  describe '#get_contact' do
    it 'returns a contact' do
      expect(Insightly.client.get_contact(1)).to be_a(Contact)
    end
  end

  # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
  describe '#get_contacts' do
    it 'returns an array of contacts' do
      contacts = Insightly.client.get_contacts
      expect(contacts).to be_a(Array)
      expect(contacts.first).to be_a(Contact)
    end
  end

  # POST /v2.1/Contacts
  describe '#create_contact' do
    it 'creates a contact' do
      expect(
        Insightly.client.create_contact(Contact.new({}))
      ).to be_a(Contact)
    end
  end

  # POST /v2.1/Contacts/{c_id}/Image/{filename}

  # PUT /v2.1/Contacts

  # PUT /v2.1/Contacts/{c_id}/Image/{filename}
end
