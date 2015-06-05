require 'insightly2/dsl'

module Insightly2
  module DSL::TeamMembers
    # GET /v2.1/TeamMembers/{id}
    # Get a team member.
    # @param [String, Fixnum] id A team member's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::TeamMember, nil].
    def get_team_member(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::TeamMember.parse(request(:get, "TeamMembers/#{id}"))
    end

    # GET /v2.1/TeamMembers?teamid={teamid}
    # Get a list of team members.
    # @param [String, Fixnum] team_id: The ID of the team we're getting members for (optional).
    # @return [Array, nil]
    def get_team_members(team_id: nil)
      Resources::TeamMember.parse(request(:get, "TeamMembers/?teamid=#{team_id}"))
    end

    # POST /v2.1/TeamMembers
    # Create a team member.
    # @param [Hash] team_member The team_member we're creating.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::TeamMember, nil].
    def create_team_member(team_member: nil)
      raise ArgumentError, "Team member cannot be blank" if team_member.blank?
      Resources::TeamMember.parse(request(:post, "TeamMembers", team_member))
    end

    # PUT /v2.1/TeamMembers
    # Update a team member.
    # @param [Hash] team_member The team_member we're updating.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::TeamMember, nil].
    def update_team_member(team_member: nil)
      raise ArgumentError, "Team member cannot be blank" if team_member.blank?
      Resources::TeamMember.parse(request(:put, "TeamMembers", team_member))
    end

    # DELETE /v2.1/TeamMembers/{id}
    # Delete a team member.
    # @param [String, Fixnum] id A team member's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_team_member(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "TeamMembers/#{id}")
    end
  end
end
