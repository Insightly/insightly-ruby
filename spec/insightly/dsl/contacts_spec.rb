require 'spec_helper'

describe Insightly::DSL::Contacts do
  # DELETE /v2.1/Contacts/{c_id}/Image

  # DELETE /v2.1/Contacts/{id}

  # GET /v2.1/Contacts/{c_id}/Emails

  # GET /v2.1/Contacts/{c_id}/Image

  # GET /v2.1/Contacts/{c_id}/Notes

  # GET /v2.1/Contacts/{c_id}/Tasks

  # GET /v2.1/Contacts/{id}
  describe '#get_contact' do
    it 'returns a contact' do
      expect(Insightly.client.get_contact(1)).to be_a(Insightly::Resources::Contact)
    end
  end

  # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}

  # POST /v2.1/Contacts

  # POST /v2.1/Contacts/{c_id}/Image/{filename}

  # PUT /v2.1/Contacts

  # PUT /v2.1/Contacts/{c_id}/Image/{filename}
end
