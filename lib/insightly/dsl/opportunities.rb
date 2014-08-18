require 'insightly/dsl'

module Insightly
  module DSL::Opportunities
    # DELETE /v2.1/Opportunities/{c_id}/Image

    # DELETE /v2.1/Opportunities/{id}
    # @param [String, Fixnum] id A Opportunity's ID
    def delete_opportunity(id)
      request(:delete, "Opportunities/#{id}")
    end

    # GET /v2.1/Opportunities/{c_id}/Emails

    # GET /v2.1/Opportunities/{c_id}/Image

    # GET /v2.1/Opportunities/{c_id}/Notes

    # GET /v2.1/Opportunities/{c_id}/StateHistory

    # GET /v2.1/Opportunities/{c_id}/Tasks

    # GET /v2.1/Opportunities/{id}
    # @return [Insightly::Resources::Opportunity]
    # @param [String, Fixnum] id A Opportunity's ID
    def get_opportunity(id)
      Resources::Opportunity.parse(request(:get, "Opportunities/#{id}"))
    end

    # GET /v2.1/Opportunities?ids={ids}&tag={tag}
    # @return [<Insightly::Resources::Opportunity>, nil]
    def get_opportunities
      Resources::Opportunity.parse(request(:get, 'Opportunities'))
    end

    # POST /v2.1/Opportunities

    # POST /v2.1/Opportunities/{c_id}/Image/{filename}

    # PUT /v2.1/Opportunities

    # PUT /v2.1/Opportunities/{c_id}/Image/{filename}
  end
end
