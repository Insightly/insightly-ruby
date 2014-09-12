require 'spec_helper'

describe Insightly::DSL::TeamMembers do
  # DELETE /v2.1/TeamMembers/{id}

  # GET /v2.1/TeamMembers/{id}
  describe '#get_team_member' do
    it 'returns a team member' do
      expect(Insightly.client.get_team_member(1)).to be_a(Insightly::Resources::TeamMember)
    end
  end

  # GET /v2.1/TeamMembers?teamid={teamid}

  # POST /v2.1/TeamMembers

  # PUT /v2.1/TeamMembers
end