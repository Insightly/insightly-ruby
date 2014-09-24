require 'insightly/dsl'

module Insightly
  module DSL::TeamMembers
    # DELETE /v2.1/TeamMembers/{id}
    # @param [String, Fixnum] id A team member's ID
    def delete_team_member(id:)
      request(:delete, "TeamMembers/#{id}")
    end

    # GET /v2.1/TeamMembers/{id}
    # @return [Insightly::Resources::TeamMember]
    # @param [String, Fixnum] id A team member's ID
    def get_team_member(id:)
      Resources::TeamMember.parse(request(:get, "TeamMembers/#{id}"))
    end

    # GET /v2.1/TeamMembers?teamid={teamid}
    # @param [String, Fixnum] team_id: The ID of the team we're getting members for.
    # @return [<Insightly::Resources::TeamMember>, nil]
    def get_team_members(team_id:)
      Resources::TeamMember.parse(request(:get, "Emails/?teamid=#{team_id}"))
    end

    # POST /v2.1/TeamMembers
    # @param [Hash] team_member The team_member we're creating
    # @return [<Insightly::Resources::TeamMember>, nil]
    def create_team_member(team_member:)
      Resources::TeamMember.parse(request(:post, 'TeamMembers', team_member))
    end

    # PUT /v2.1/TeamMembers
    # @param [Hash] team_member The team_member we're updating
    # @return [<Insightly::Resources::TeamMember>, nil]
    def update_team_member(team_member:)
      Resources::TeamMember.parse(request(:put, 'TeamMembers', team_member))
    end
  end
end
