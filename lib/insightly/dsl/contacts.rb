require 'insightly/dsl'

module Insightly
  module DSL::Contacts
    # GET /v2.1/Contacts/{id}
    # Gets a contact by id.
    # @param [String, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Contact, nil].
    def get_contact(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Contact.parse(request(:get, "Contacts/#{id}"))
    end

    # GET /v2.1/Contacts/{c_id}/Emails
    # Gets a contact's emails.
    # @param [id:] id of the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_contact_emails(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Email.parse(request(:get, "Contacts/#{id}/Emails"))
    end

    # GET /v2.1/Contacts/{c_id}/Image
    # Gets a contact's image.
    # @param [String, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    # TODO - What does this return?
    # def get_contact_image(id:)
    #   raise ArgumentError, "ID cannot be nil" if id.nil?
    #   request(:get, "Contacts/#{id}/Image")
    # end

    # GET /v2.1/Contacts/{c_id}/Notes
    # Gets a contact's notes.
    # @param [String, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_contact_notes(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Note.parse(request(:get, "Contacts/#{id}/Notes"))
    end

    # GET /v2.1/Contacts/{c_id}/Tasks
    # Gets a contact's tasks.
    # @param [String, Fixnum] id The ID of the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_contact_tasks(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Task.parse(request(:get, "Contacts/#{id}/Tasks"))
    end

    # GET /v2.1/Contacts?ids={ids}&email={email}&tag={tag}
    # Get a list of contacts.
    # @param [Array] ids The contact ids of the contacts to return (optional).
    # @param [String] email The email address of the contact to return (optional).
    # @param [String] tag The tag that has been applied to contacts (optional).
    # @return [Array, nil].
    def get_contacts(ids: [], email: '', tag: '')
      ids = ids.join(',')
      Resources::Contact.parse(request(:get, "Contacts/?ids=#{ids}&email=#{email}&tag=#{tag}"))
    end

    # POST /v2.1/Contacts
    # Creates a contact.
    # @param [Hash] contact The contact to create.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Contact, nil].
    def create_contact(contact:)
      raise ArgumentError, "Contact cannot be nil" if contact.nil?
      Resources::Contact.parse(request(:post, "Contacts", contact))
    end

    # POST /v2.1/Contacts/{c_id}/Image/{filename}
    # Adds a contact's image.
    # @param [String, Fixnum] id The ID of the contact.
    # @param [String] filename The name of image file to be attached to the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def create_contact_image(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:post, "Contacts/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Contacts
    # Updates a contact.
    # @param [Hash] contact The contact to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Contact, nil].
    def update_contact(contact:)
      raise ArgumentError, "Contact cannot be nil" if contact.nil?
      Resources::Contact.parse(request(:put, "Contacts", contact))
    end

    # PUT /v2.1/Contacts/{c_id}/Image/{filename}
    # Updates a contact's image.
    # @param [String, Fixnum] id The ID of the contact.
    # @param [String] filename The name of image file to be attached to the contact.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def update_contact_image(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:put, "Contacts/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Contacts/{id}
    # Deletes a contact.
    # @param [String, Fixnum] id The ID of the contact to delete.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_contact(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Contacts/#{id}")
    end

    # DELETE /v2.1/Contacts/{c_id}/Image
    # Deletes a contact's image.
    # @param [String, Fixnum] id The ID of the contact with the image to delete.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_contact_image(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Contacts/#{id}/Image")
    end
  end
end
