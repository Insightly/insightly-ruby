require 'insightly/dsl'

module Insightly
  # https://api.insight.ly/v2.1/Help/ApiController/Teams
  module DSL::Teams
    # DELETE /v2.1/Teams/{id}
    # @param [String, Fixnum] id A Team's ID
    def delete_team(id:)
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
    def get_team(id:)
      Resources::Team.parse(request(:get, "Teams/#{id}"))
    end

    # POST /v2.1/Teams
    # @param [Hash] team The team we're creating
    # @return [<Insightly::Resources::Team>, nil]
    def create_team(team:)
      Resources::Team.parse(request(:post, 'Teams', team))
    end

    # PUT /v2.1/Teams
    # @param [Hash] team The team we're updating
    # @return [<Insightly::Resources::Team>, nil]
    def update_team(team:)
      Resources::Team.parse(request(:put, 'Teams', team))
    end
  end
end
