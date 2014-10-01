require 'insightly/dsl'

module Insightly
  module DSL::Contacts
    # GET /v2.1/Contacts/{id}
    # Gets a contact by id.
    # @param [UrlHelper, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Contact, nil].
    def get_contact(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Contact.parse(request(:get, "Contacts/#{id}"))
    end

    # GET /v2.1/Contacts/{c_id}/Emails
    # Gets a contact's emails.
    # @param [id:] id of the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_contact_emails(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Email.parse(request(:get, "Contacts/#{id}/Emails"))
    end

    # GET /v2.1/Contacts/{c_id}/Image
    # Gets a contact's image.
    # @param [UrlHelper, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    # TODO - What does this return?
    # def get_contact_image(id:)
    #   raise ArgumentError, "ID cannot be blank" if id.blank?
    #   request(:get, "Contacts/#{id}/Image")
    # end

    # GET /v2.1/Contacts/{c_id}/Notes
    # Gets a contact's notes.
    # @param [UrlHelper, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_contact_notes(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Note.parse(request(:get, "Contacts/#{id}/Notes"))
    end

    # GET /v2.1/Contacts/{c_id}/Tasks
    # Gets a contact's tasks.
    # @param [UrlHelper, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_contact_tasks(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Task.parse(request(:get, "Contacts/#{id}/Tasks"))
    end

    # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
    # Get a list of contacts.
    # @param [Array] ids The contact ids of the contacts to return (optional).
    # @param [UrlHelper] email The email address of the contact to return (optional).
    # @param [UrlHelper] tag The tag that has been applied to contacts (optional).
    # @return [Array, nil].
    def get_contacts(ids: [], email: '', tag: '')
      url = UrlHelper.build_url(path: "Contacts", params: {ids: ids.join(','), email: email, tag: tag})
      Resources::Contact.parse(request(:get, url))
    end

    # POST /v2.1/Contacts
    # Creates a contact.
    # @param [Hash] contact The contact to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Contact, nil].
    def create_contact(contact:)
      raise ArgumentError, "Contact cannot be blank" if contact.blank?
      Resources::Contact.parse(request(:post, "Contacts", contact))
    end

    # POST /v2.1/Contacts/{c_id}/Image/{filename}
    # Adds a contact's image.
    # @param [UrlHelper, Fixnum] id The ID of the contact.
    # @param [UrlHelper] filename The name of image file to be attached to the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [RestClient::Response].
    def create_contact_image(id:, filename:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      raise ArgumentError, "Filename cannot be blank" if filename.blank?
      request(:post, "Contacts/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Contacts
    # Updates a contact.
    # @param [Hash] contact The contact to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Contact, nil].
    def update_contact(contact:)
      raise ArgumentError, "Contact cannot be blank" if contact.blank?
      Resources::Contact.parse(request(:put, "Contacts", contact))
    end

    # PUT /v2.1/Contacts/{c_id}/Image/{filename}
    # Updates a contact's image.
    # @param [UrlHelper, Fixnum] id The ID of the contact.
    # @param [UrlHelper] filename The name of image file to be attached to the contact.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [RestClient::Response].
    def update_contact_image(id:, filename:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      raise ArgumentError, "Filename cannot be blank" if filename.blank?
      request(:put, "Contacts/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Contacts/{id}
    # Deletes a contact.
    # @param [UrlHelper, Fixnum] id The ID of the contact to delete.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [RestClient::Response].
    def delete_contact(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "Contacts/#{id}")
    end

    # DELETE /v2.1/Contacts/{c_id}/Image
    # Deletes a contact's image.
    # @param [UrlHelper, Fixnum] id The ID of the contact with the image to delete.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [RestClient::Response].
    def delete_contact_image(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "Contacts/#{id}/Image")
    end
  end
end
