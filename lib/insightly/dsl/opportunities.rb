require 'insightly/dsl'

module Insightly
  module DSL::Opportunities
    # GET /v2.1/Opportunities/{id}
    # Get an opportunity.
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [Insightly::Resources::Opportunity, nil].
    def get_opportunity(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}"))
    end

    # GET /v2.1/Opportunities/{c_id}/Emails
    # Get an opportunity's emails.
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [Array, nil].
    def get_opportunity_emails(id:)
      Resources::Email.parse(request(:get, "Opportunities/#{id}/Emails"))
    end

    # GET /v2.1/Opportunities/{c_id}/Image
    # @param [String, Fixnum] id An opportunity's ID
    # TODO - What does this return?
    # def get_opportunity_image(id:)
    #   Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/Image"))
    # end

    # GET /v2.1/Opportunities/{c_id}/Notes
    # Get an opportunity's notes.
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [Array, nil].
    def get_opportunity_notes(id:)
      Resources::Note.parse(request(:get, "Opportunities/#{id}/Notes"))
    end

    # GET /v2.1/Opportunities/{c_id}/StateHistory
    # Get an opportunity's state history.
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [Array, nil].
    def get_opportunity_state_history(id:)
      Resources::OpportunityStateReason.parse(request(:get, "Opportunities/#{id}/StateHistory"))
    end

    # GET /v2.1/Opportunities/{c_id}/Tasks
    # Get an opportunity's tasks.
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [Array, nil].
    def get_opportunity_tasks(id:)
      Resources::Task.parse(request(:get, "Opportunities/#{id}/Tasks"))
    end

    # GET /v2.1/Opportunities?ids={ids}&tag={tag}
    # Get a list of opportunities.
    # @param [Array] ids IDs of opportunities.
    # @param [String] tag The tag that has been applied to an opportunity.
    # @return [Array, nil].
    def get_opportunities(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Opportunity.parse(request(:get, "Opportunities?ids=#{ids}&tag=#{tag}"))
    end

    # POST /v2.1/Opportunities
    # Create an opportunity.
    # @param [Hash] opportunity The opportunity to create.
    # @return [Insightly::Resources::Opportunity, nil].
    def create_opportunity(opportunity:)
      Resources::Opportunity.parse(request(:post, "Opportunities", opportunity))
    end

    # POST /v2.1/Opportunities/{c_id}/Image/{filename}
    # Add an attachment to an opportunity.
    # @param [String, Fixnum] id An opportunity's ID.
    # @param [String] filename A name of a file.
    # @return [RestClient::Response]
    def create_opportunity_image(id:, filename:)
      request(:post, "Opportunities/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Opportunities
    # Update an opportunity.
    # @param [Hash] opportunity The opportunity to update.
    # @return [Insightly::Resources::Opportunity, nil]
    def update_opportunity(opportunity:)
      Resources::Opportunity.parse(request(:put, "Opportunities", opportunity))
    end

    # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
    # @param [String, Fixnum] id An opportunity's ID.
    # @param [String] filename A name of a file.
    # @return [RestClient::Response].
    def update_opportunity_image(id:, filename:)
      request(:put, "Opportunities/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Opportunities/{id}
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [RestClient::Response].
    def delete_opportunity(id:)
      request(:delete, "Opportunities/#{id}")
    end

    # DELETE /v2.1/Opportunities/{c_id}/Image
    # @param [String, Fixnum] id An opportunity's ID.
    # @return [RestClient::Response].
    def delete_opportunity_image(id:)
      request(:delete, "Opportunities/#{id}/Image")
    end
  end
end
