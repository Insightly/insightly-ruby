require 'insightly/dsl'

module Insightly
  module DSL::Contacts
    # DELETE /v2.1/Contacts/{c_id}/Image

    # DELETE /v2.1/Contacts/{id}
    # @param [String, Fixnum] id A Contact's ID
    def delete_contact(id)
      request(:delete, "Contacts/#{id}")
    end

    # GET /v2.1/Contacts/{c_id}/Emails

    # GET /v2.1/Contacts/{c_id}/Image

    # GET /v2.1/Contacts/{c_id}/Notes

    # GET /v2.1/Contacts/{c_id}/Tasks

    # GET /v2.1/Contacts/{id}
    # @return [Insightly::Resources::Contact]
    # @param [String, Fixnum] id A Contact's ID
    def get_contact(id)
      Resources::Contact.parse(request(:get, "Contacts/#{id}"))
    end

    # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
    # @param [Hash] options
    # @option options :ids [Array]
    # @option options :email [String]
    # @option options :tag [String]
    # @return [<Insightly::Resources::Contact>, nil]
    def get_contacts(options = {})
      Resources::Contact.parse(request(:get, 'Contacts', options))
    end

    # POST /v2.1/Contacts
    # @param [Insightly::Resources::Contact] contact The contact we're creating
    # @return [<Insightly::Resources::Contact>, nil]
    def create_contact(contact)
      Resources::Contact.parse(request(:post, 'Contacts', contact))
    end

    # POST /v2.1/Contacts/{c_id}/Image/{filename}

    # PUT /v2.1/Contacts

    # PUT /v2.1/Contacts/{c_id}/Image/{filename}
  end
end
