require 'insightly/dsl'

module Insightly
  module DSL::Opportunities
    # GET /v2.1/Opportunities/{id}
    # Get an opportunity.
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Opportunity, nil].
    def get_opportunity(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}"))
    end

    # GET /v2.1/Opportunities/{c_id}/Emails
    # Get an opportunity's emails.
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_opportunity_emails(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Email.parse(request(:get, "Opportunities/#{id}/Emails"))
    end

    # GET /v2.1/Opportunities/{c_id}/Image
    # @param [String, Fixnum] id An opportunity's ID
    # @raise [ArgumentError] If the method arguments are nil.
    # TODO - What does this return?
    # def get_opportunity_image(id:)
    #   Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/Image"))
    # end

    # GET /v2.1/Opportunities/{c_id}/Notes
    # Get an opportunity's notes.
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_opportunity_notes(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Note.parse(request(:get, "Opportunities/#{id}/Notes"))
    end

    # GET /v2.1/Opportunities/{c_id}/StateHistory
    # Get an opportunity's state history.
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_opportunity_state_history(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::OpportunityStateReason.parse(request(:get, "Opportunities/#{id}/StateHistory"))
    end

    # GET /v2.1/Opportunities/{c_id}/Tasks
    # Get an opportunity's tasks.
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Array, nil].
    def get_opportunity_tasks(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Task.parse(request(:get, "Opportunities/#{id}/Tasks"))
    end

    # GET /v2.1/Opportunities?ids={ids}&tag={tag}
    # Get a list of opportunities.
    # @param [Array] ids IDs of opportunities (optional).
    # @param [String] tag The tag that has been applied to an opportunity (optional).
    # @return [Array, nil].
    def get_opportunities(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Opportunity.parse(request(:get, "Opportunities?ids=#{ids}&tag=#{tag}"))
    end

    # POST /v2.1/Opportunities
    # Create an opportunity.
    # @param [Hash] opportunity The opportunity to create.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Opportunity, nil].
    def create_opportunity(opportunity:)
      raise ArgumentError, "Opportunity cannot be nil" if opportunity.nil?
      Resources::Opportunity.parse(request(:post, "Opportunities", opportunity))
    end

    # POST /v2.1/Opportunities/{c_id}/Image/{filename}
    # Add an attachment to an opportunity.
    # @param [String, Fixnum] id An opportunity's ID.
    # @param [String] filename A name of a file.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response]
    def create_opportunity_image(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:post, "Opportunities/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Opportunities
    # Update an opportunity.
    # @param [Hash] opportunity The opportunity to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Opportunity, nil]
    def update_opportunity(opportunity:)
      raise ArgumentError, "Opportunity cannot be nil" if opportunity.nil?
      Resources::Opportunity.parse(request(:put, "Opportunities", opportunity))
    end

    # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
    # @param [String, Fixnum] id An opportunity's ID.
    # @param [String] filename A name of a file.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def update_opportunity_image(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:put, "Opportunities/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Opportunities/{id}
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_opportunity(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Opportunities/#{id}")
    end

    # DELETE /v2.1/Opportunities/{c_id}/Image
    # @param [String, Fixnum] id An opportunity's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_opportunity_image(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Opportunities/#{id}/Image")
    end
  end
end
