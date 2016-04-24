require 'insightly2/dsl'

module Insightly2
  module DSL::LeadStatuses
    # GET /v2.1/LeadStatuses?includeConverted={includeConverted}
    # Get a list of lead statuses.
    # @return [Array, nil].
    def get_lead_statuses(includeConverted: 'false')
      url = Utils::UrlHelper.build_url(path: 'LeadStatuses', params: { includeConverted: includeConverted })
      Resources::LeadStatus.parse(request(:get, url))
    end

    # POST /v2.1/LeadStatuses
    # Create a lead status.
    # @param [Hash] lead_status: The lead status to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::LeadStatus, nil].
    def create_lead_status(lead_status: nil)
      raise ArgumentError, 'lead status cannot be blank' if lead_status.blank?
      Resources::LeadStatus.parse(request(:post, 'LeadStatuses', lead_status))
    end

    # PUT /v2.1/LeadStatuses
    # Update a lead status.
    # @param [Hash] lead_status: The lead status to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::LeadStatus, nil]
    def update_lead_status(lead_status: nil)
      raise ArgumentError, 'lead status cannot be blank' if lead_status.blank?
      Resources::LeadStatus.parse(request(:put, 'LeadStatuses', lead_status))
    end

    # DELETE /v2.1/LeadStatuses/{id}
    # Delete a lead status.
    # @param [String, Fixnum] id A lead status's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_lead_status(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:delete, "LeadStatuses/#{id}")
    end
  end
end
