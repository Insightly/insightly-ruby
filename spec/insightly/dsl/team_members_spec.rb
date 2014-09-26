require 'spec_helper'

describe Insightly::DSL::TeamMembers do
  # DELETE /v2.1/TeamMembers/{id}
  describe '#delete_team_member' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_team_member(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/TeamMembers/{id}
  describe '#get_team_member' do
    it 'returns a team member' do
      expect(Insightly.client.get_team_member(id: 1)).to be_a(Insightly::Resources::TeamMember)
    end
  end

  # GET /v2.1/TeamMembers?teamid={teamid}
  describe '#get_team_members' do
    xit 'returns an array of team_members' do
      team_members = Insightly.client.get_team_members(team_id: 1)
      expect(team_members).to be_a(Array)
      expect(team_members.first).to be_a(TeamMember)
    end
  end

  # POST /v2.1/TeamMembers
  describe '#create_team_member' do
    it 'returns a team_member' do
      expect(Insightly.client.create_team_member(team_member: {})).to be_a(Insightly::Resources::TeamMember)
    end
  end

  # PUT /v2.1/TeamMembers
  describe '#update_team_member' do
    it 'returns a team_member' do
      expect(Insightly.client.update_team_member(team_member: {})).to be_a(Insightly::Resources::TeamMember)
    end
  end
end