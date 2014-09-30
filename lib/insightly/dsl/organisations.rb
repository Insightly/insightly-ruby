require 'insightly/dsl'

module Insightly
  module DSL::Organisations
    # GET /v2.1/Organisations/{id}
    # Get an organisation.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Organisation, nil].
    def get_organisation(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Organisation.parse(request(:get, "Organisations/#{id}"))
    end

    # GET /v2.1/Organisations/{c_id}/Emails
    # Get an organisation's emails.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_organisation_emails(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Email.parse(request(:get, "Organisations/#{id}/Emails"))
    end

    # GET /v2.1/Organisations/{c_id}/Image
    # Get an organisations image.
    # @param [String, Fixnum] id An organisation's ID
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Organisation]
    # TODO - What does this return?
    # def get_organisation_image(id:)
    #   Resources::Organisation.parse(request(:get, "Organisations/#{id}/Image"))
    # end

    # GET /v2.1/Organisations/{c_id}/Notes
    # Get an organisations notes.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_organisation_notes(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Note.parse(request(:get, "Organisations/#{id}/Notes"))
    end

    # GET /v2.1/Organisations/{c_id}/Tasks
    # Get an organisations tasks.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_organisation_tasks(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Task.parse(request(:get, "Organisations/#{id}/Tasks"))
    end

    # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}
    # @param [Array] ids The organisation's IDs (optional).
    # @param [String] domain The email domain (optional).
    # @param [String] tag The tag an organisation has been tagged with (optional).
    # @return [Array, nil].
    def get_organisations(ids: [], domain: '', tag: '')
      ids = ids.join(',')
      Resources::Organisation.parse(request(:get, "Organisations?ids=#{ids}&domain=#{domain}&tag=#{tag}"))
    end

    # POST /v2.1/Organisations
    # Create an organisation.
    # @param [Hash] organisation The organisation to create.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Organisation].
    def create_organisation(organisation:)
      raise ArgumentError, "Organisation cannot be nil" if organisation.nil?
      Resources::Organisation.parse(request(:post, "Organisations", organisation))
    end

    # POST /v2.1/Organisations/{c_id}/Image/{filename}
    # Create an organisation image.
    # @param [String, Fixnum] id The organisation's ID.
    # @param [String] filename The name of the file.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def create_organisation_image(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:post, "Organisations/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Organisations
    # Update an organisation.
    # @param [Hash] organisation The organisation to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Organisation, nil].
    def update_organisation(organisation:)
      raise ArgumentError, "Organisation cannot be nil" if organisation.nil?
      Resources::Organisation.parse(request(:put, "Organisations", organisation))
    end

    # PUT /v2.1/Organisations/{c_id}/Image/{filename}
    # Update an organisation's image.
    # @param [String, Fixnum] id An organisation's ID.
    # @param [String] filename name of the file.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def update_organisation_image(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:put, "Organisations/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Organisations/{id}
    # Delete an organisation.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_organisation(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Organisations/#{id}")
    end

    # DELETE /v2.1/Organisations/{c_id}/Image
    # Delete an organisation image.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_organisation_image(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Organisations/#{id}/Image")
    end
  end
end
