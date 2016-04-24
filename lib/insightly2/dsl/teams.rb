require 'insightly2/dsl'

module Insightly2
  # https://api.insight.ly/v2.1/Help/ApiController/Teams
  module DSL::Teams
    # GET /v2.1/Teams/{id}
    # Get a team.
    # @param [String, Fixnum] id A team's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Team].
    def get_team(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
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
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Team, nil].
    def create_team(team: nil)
      raise ArgumentError, 'Team cannot be blank' if team.blank?
      Resources::Team.parse(request(:post, 'Teams', team))
    end

    # PUT /v2.1/Teams
    # Update a team..
    # @param [Hash] team The team we're updating.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Team, nil].
    def update_team(team: nil)
      raise ArgumentError, 'Team cannot be blank' if team.blank?
      Resources::Team.parse(request(:put, 'Teams', team))
    end

    # DELETE /v2.1/Teams/{id}
    # Delete a team.
    # @param [String, Fixnum] id A Team's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_team(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:delete, "Teams/#{id}")
    end
  end
end
