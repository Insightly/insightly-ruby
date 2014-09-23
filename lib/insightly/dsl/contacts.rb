require 'insightly/dsl'

module Insightly
  module DSL::Contacts
    # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
    # Gets a list of Contacts.
    # @param [ids:] Array of contact ids (optional).
    # @param [email:] email address (optional).
    # @param [tag:] single tag (optional).
    def get_contacts(ids: [], email: '', tag: '')
    end

    # GET /v2.1/Contacts/{id}
    # Gets a contact by id.
    # @param [id:] id of the contact.
    def get_contact(id:)
    end

    # POST /v2.1/Contacts
    # Creates a contact.
    # @param [contact:] Hash of contact attributes.
    def create_contact(contact:)
    end

    # PUT /v2.1/Contacts
    # Updates a contact.
    # @param [contact:] Hash of contact attributes.
    def update_contact(contact:)
    end

    # DELETE /v2.1/Contacts/{id}
    # Deletes a Contact.
    # @param [id:] id of the contact.
    def delete_contact(id:)
    end

    # GET /v2.1/Contacts/{c_id}/Emails
    # Gets a Contact's Emails.
    # @param [id:] id of the contact.
    def get_contact_emails(id:)
    end

    # GET /v2.1/Contacts/{c_id}/Notes
    # Gets a Contact's Notes.
    # @param [id:] id of the contact.
    def get_contact_notes(id:)
    end

    # GET /v2.1/Contacts/{c_id}/Tasks
    # Gets a Contact's Tasks.
    # @param [id:] id of the contact.
    def get_contact_tasks(id:)
    end

    # GET /v2.1/Contacts/{c_id}/Image
    # Gets a Contact's Image.
    # @param [id:] id of the contact.
    def get_contact_image(id:)
    end

    # POST /v2.1/Contacts/{c_id}/Image/{filename}
    # Adds a Contact's Image
    # @param [id:] id of the contact.
    # @param [filename:] Name of Image File to be attached to Contact.
    def add_contact_image(id:, filename:)
    end

    # PUT /v2.1/Contacts/{c_id}/Image/{filename}
    # Updates a Contact's Image.
    # @param [id:] id of the contact.
    # @param [filename:] Name of Image File to be attached to Contact.
    def update_contact_image(id:, filename:)
    end

    # DELETE /v2.1/Contacts/{c_id}/Image
    # Deletes a Contact's Image.
    def delete_contact_image(id:)
    end
  end
end
