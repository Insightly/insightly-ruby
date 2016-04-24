require 'insightly2/dsl'

module Insightly2
  module DSL::Organisations
    # GET /v2.1/Organisations/{id}
    # Get an organisation.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Organisation, nil].
    def get_organisation(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Organisation.parse(request(:get, "Organisations/#{id}"))
    end

    # GET /v2.1/Organisations/{c_id}/Emails
    # Get an organisation's emails.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_organisation_emails(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Email.parse(request(:get, "Organisations/#{id}/Emails"))
    end

    # GET /v2.1/Organisations/{c_id}/Image
    # Get an organisations image.
    # @param [String, Fixnum] id An organisation's ID
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def get_organisation_image(id: nil)
      request(:get, "Organisations/#{id}/Image")
    end

    # GET /v2.1/Organisations/{c_id}/Notes
    # Get an organisations notes.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_organisation_notes(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Note.parse(request(:get, "Organisations/#{id}/Notes"))
    end

    # GET /v2.1/Organisations/{c_id}/Tasks
    # Get an organisations tasks.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_organisation_tasks(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Task.parse(request(:get, "Organisations/#{id}/Tasks"))
    end

    # GET /v2.1/Organisations?ids={ids}&domain={domain}&tag={tag}
    # @param [Array] ids The organisation's IDs (optional).
    # @param [String] domain The email domain (optional).
    # @param [String] tag The tag an organisation has been tagged with (optional).
    # @return [Array, nil].
    def get_organisations(ids: [], domain: '', tag: '')
      url = Utils::UrlHelper.build_url(path: 'Organisations', params: {ids: ids.join(','), domain: domain, tag: tag})
      Resources::Organisation.parse(request(:get, url))
    end

    # POST /v2.1/Organisations
    # Create an organisation.
    # @param [Hash] organisation The organisation to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Organisation].
    def create_organisation(organisation: nil)
      raise ArgumentError, 'Organisation cannot be blank' if organisation.blank?
      Resources::Organisation.parse(request(:post, "Organisations", organisation))
    end

    # POST /v2.1/Organisations/{c_id}/Image/{filename}
    # Create an organisation image.
    # @param [String, Fixnum] id The organisation's ID.
    # @param [String] filename The name of the file.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def create_organisation_image(id: nil, filename: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      raise ArgumentError, 'Filename cannot be blank' if filename.blank?
      request(:post, "Organisations/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Organisations
    # Update an organisation.
    # @param [Hash] organisation The organisation to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Organisation, nil].
    def update_organisation(organisation: nil)
      raise ArgumentError, 'Organisation cannot be blank' if organisation.blank?
      Resources::Organisation.parse(request(:put, "Organisations", organisation))
    end

    # PUT /v2.1/Organisations/{c_id}/Image/{filename}
    # Update an organisation's image.
    # @param [String, Fixnum] id An organisation's ID.
    # @param [String] filename name of the file.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def update_organisation_image(id: nil, filename: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      raise ArgumentError, 'Filename cannot be blank' if filename.blank?
      request(:put, "Organisations/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Organisations/{id}
    # Delete an organisation.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_organisation(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:delete, "Organisations/#{id}")
    end

    # DELETE /v2.1/Organisations/{c_id}/Image
    # Delete an organisation image.
    # @param [String, Fixnum] id An organisation's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_organisation_image(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "Organisations/#{id}/Image")
    end
  end
end
