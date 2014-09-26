require 'insightly/dsl'

module Insightly
  # https://api.insight.ly/v2.1/Help/ApiController/Teams
  module DSL::Teams
    # GET /v2.1/Teams/{id}
    # Get a team.
    # @param [String, Fixnum] id A team's ID.
    # @return [Insightly::Resources::Team].
    def get_team(id:)
      Resources::Team.parse(request(:get, "Teams/#{id}"))
    end

    # GET /v2.1/Teams
    # Get teams.
    # @return [Array, nil].
    def get_teams
      Resources::Team.parse(request(:get, 'Teams'))
    end

    # POST /v2.1/Teams
    # Create a team.
    # @param [Hash] team The team we're creating.
    # @return [Insightly::Resources::Team, nil].
    def create_team(team:)
      Resources::Team.parse(request(:post, 'Teams', team))
    end

    # PUT /v2.1/Teams
    # Update a team..
    # @param [Hash] team The team we're updating.
    # @return [Insightly::Resources::Team, nil].
    def update_team(team:)
      Resources::Team.parse(request(:put, 'Teams', team))
    end

    # DELETE /v2.1/Teams/{id}
    # Delete a team.
    # @param [String, Fixnum] id A Team's ID.
    # @return [RestClient::Response].
    def delete_team(id:)
      request(:delete, "Teams/#{id}")
    end
  end
end
