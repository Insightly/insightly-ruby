require 'insightly/dsl'

module Insightly
  module DSL::Teams
    # DELETE /v2.1/Teams/{id}
    # @param [String, Fixnum] id A Team's ID
    def delete_team(id)
      request(:delete, "Teams/#{id}")
    end

    # GET /v2.1/Teams
    # @return [<Insightly::Resources::Team>, nil]
    def get_teams
      Resources::Team.parse(request(:get, 'Teams'))
    end

    # GET /v2.1/Teams/{id}
    # @return [Insightly::Resources::Team]
    # @param [String, Fixnum] id A Team's ID
    def get_team(id)
      Resources::Team.parse(request(:get, "Teams/#{id}"))
    end

    # POST /v2.1/Teams

    # PUT /v2.1/Teams
  end
end
