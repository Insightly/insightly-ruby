require 'insightly/dsl'

module Insightly
  module DSL::Opportunities
    # DELETE /v2.1/Opportunities/{c_id}/Image
    # @param [String, Fixnum] id A Opportunity's ID
    def delete_opportunity_image(id:)
      request(:delete, "Opportunities/#{id}/Image")
    end

    # DELETE /v2.1/Opportunities/{id}
    # @param [String, Fixnum] id A Opportunity's ID
    def delete_opportunity(id:)
      request(:delete, "Opportunities/#{id}")
    end

    # GET /v2.1/Opportunities/{c_id}/Emails
    # @param [String, Fixnum] id An Opportunity's ID
    def get_opportunity_emails(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/Emails"))
    end

    # GET /v2.1/Opportunities/{c_id}/Image
    # @param [String, Fixnum] id An Opportunity's ID
    def get_opportunity_image(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/Image"))
    end

    # GET /v2.1/Opportunities/{c_id}/Notes
    # @param [String, Fixnum] id An Opportunity's ID
    def get_opportunity_notes(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/Notes"))
    end

    # GET /v2.1/Opportunities/{c_id}/StateHistory
    # @param [String, Fixnum] id An Opportunity's ID
    def get_opportunity_state_history(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/StateHistory"))
    end

    # GET /v2.1/Opportunities/{c_id}/Tasks
    # @param [String, Fixnum] id An Opportunity's ID
    # @return [Array, nil]
    def get_opportunity_tasks(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}/Tasks"))
    end

    # GET /v2.1/Opportunities/{id}
    # @return [Insightly::Resources::Opportunity]
    # @param [String, Fixnum] id An Opportunity's ID
    def get_opportunity(id:)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}"))
    end

    # GET /v2.1/Opportunities?ids={ids}&tag={tag}
    # @param [Array] ids IDs of opportunities.
    # @param [String] tag
    # @return [<Insightly::Resources::Opportunity>, nil]
    def get_opportunities(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Opportunity.parse(request(:get, "Opportunities?ids=#{ids}&tag=#{tag}"))
    end

    # POST /v2.1/Opportunities
    # @param [Hash] opportunity attributes.
    # @return [<Insightly::Resources::Opportunity>]
    def create_opportunity(opportunity:)
      Resources::Opportunity.parse(request(:post, "Opportunities", opportunity))
    end

    # POST /v2.1/Opportunities/{c_id}/Image/{filename}
    # @param [String, Fixnum] id An Opportunity's ID
    # @param [String] filename A name of a file
    def create_opportunity_image(id:, filename:)
      request(:post, "Opportunities/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Opportunities
    # @param [Hash] opportunity attributes.
    # @return [<Insightly::Resources::Opportunity>]
    def update_opportunity(opportunity:)
      Resources::Opportunity.parse(request(:put, "Opportunities", opportunity))
    end

    # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
    # @param [String, Fixnum] id An Opportunity's ID
    # @param [String] filename A name of a file
    def update_opportunity_image(id:, filename:)
      request(:put, "Opportunities/#{id}/Image/#{filename}")
    end
  end
end
