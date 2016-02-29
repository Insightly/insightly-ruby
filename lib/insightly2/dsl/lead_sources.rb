require 'insightly2/dsl'

module Insightly2
  module DSL::LeadSources
    # GET /v2.1/LeadSources
    # Get a list of lead sources.
    # @return [Array, nil].
    def get_lead_sources
      Resources::LeadSource.parse(request(:get, "LeadSources"))
    end

    # POST /v2.1/LeadSources
    # Create a lead source.
    # @param [Hash] lead_source: The lead source to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::LeadSource, nil].
    def create_lead_source(lead_source: nil)
      raise ArgumentError, "lead source cannot be blank" if lead_source.blank?
      Resources::LeadSource.parse(request(:post, "LeadSources", lead_source))
    end

    # PUT /v2.1/LeadSources
    # Update a lead source.
    # @param [Hash] lead_source: The lead source to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::LeadSource, nil]
    def update_lead_source(lead_source: nil)
      raise ArgumentError, "lead source cannot be blank" if lead_source.blank?
      Resources::LeadSource.parse(request(:put, "LeadSources", lead_source))
    end

    # DELETE /v2.1/LeadSources/{id}
    # Delete a lead source.
    # @param [String, Fixnum] id A lead source's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_lead_source(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "LeadSources/#{id}")
    end
  end
end
