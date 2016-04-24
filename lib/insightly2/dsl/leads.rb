require 'insightly2/dsl'

module Insightly2
  module DSL::Leads
    # GET /v2.1/Leads/{id}
    # Gets a lead by id.
    # @param [String, Fixnum] id The ID of the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Lead, nil].
    def get_lead(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Lead.parse(request(:get, "Leads/#{id}"))
    end

    # GET /v2.1/Leads/{c_id}/Emails
    # Gets a lead's emails.
    # @param [id:] id of the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_lead_emails(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Email.parse(request(:get, "Leads/#{id}/Emails"))
    end

    # GET /v2.1/Leads/{c_id}/Image
    # Gets a lead's image.
    # @param [String, Fixnum] id The ID of the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def get_lead_image(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:get, "Leads/#{id}/Image")
    end

    # GET /v2.1/Leads/{c_id}/Notes
    # Gets a lead's notes.
    # @param [String, Fixnum] id The ID of the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_lead_notes(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Note.parse(request(:get, "Leads/#{id}/Notes"))
    end

    # GET /v2.1/Leads/{c_id}/Tasks
    # Gets a lead's tasks.
    # @param [String, Fixnum] id The ID of the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_lead_tasks(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Task.parse(request(:get, "Leads/#{id}/Tasks"))
    end

    # GET /v2.1/Leads?ids={ids}&email={email}&tag={tag}&includeConverted={includeConverted}
    # Get a list of Leads.
    # @param [Array] ids The lead ids of the Leads to return (optional).
    # @param [String] email The email address of the lead to return (optional).
    # @param [String] tag The tag that has been applied to Leads (optional).
    # @param [String] includeConverted by default converted leads are not included, pass in "true" to include them in the response (optional).
    # @return [Array, nil].
    def get_leads(ids: [], email: '', tag: '', includeConverted: 'false')
      url = Utils::UrlHelper.build_url(path: 'Leads', params: {ids: ids.join(','), email: email, tag: tag, includeConverted: includeConverted})
      Resources::Lead.parse(request(:get, url))
    end

    # POST /v2.1/Leads
    # Creates a lead.
    # @param [Hash] lead The lead to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Lead, nil].
    def create_lead(lead: nil)
      raise ArgumentError, 'lead cannot be blank' if lead.blank?
      Resources::Lead.parse(request(:post, 'Leads', lead))
    end

    # POST /v2.1/Leads/{c_id}/Image/{filename}
    # Adds a lead's image.
    # @param [String, Fixnum] id The ID of the lead.
    # @param [String] filename The name of image file to be attached to the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def create_lead_image(id: nil, filename: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      raise ArgumentError, 'Filename cannot be blank' if filename.blank?
      request(:post, "Leads/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Leads
    # Updates a lead.
    # @param [Hash] lead The lead to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Lead, nil].
    def update_lead(lead: nil)
      raise ArgumentError, 'lead cannot be blank' if lead.blank?
      Resources::Lead.parse(request(:put, 'Leads', lead))
    end

    # PUT /v2.1/Leads/{c_id}/Image/{filename}
    # Updates a lead's image.
    # @param [String, Fixnum] id The ID of the lead.
    # @param [String] filename The name of image file to be attached to the lead.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def update_lead_image(id: nil, filename: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      raise ArgumentError, 'Filename cannot be blank' if filename.blank?
      request(:put, "Leads/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Leads/{id}
    # Deletes a lead.
    # @param [String, Fixnum] id The ID of the lead to delete.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_lead(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:delete, "Leads/#{id}")
    end

    # DELETE /v2.1/Leads/{c_id}/Image
    # Deletes a lead's image.
    # @param [String, Fixnum] id The ID of the lead with the image to delete.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_lead_image(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:delete, "Leads/#{id}/Image")
    end
  end
end
