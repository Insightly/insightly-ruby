require 'spec_helper'

describe Insightly2::DSL::TeamMembers do
  let(:team_member_id) { 5016224 }
  let(:team_id) { 2063767 }

  # GET /v2.1/TeamMembers/{id}
  describe '#get_team_member' do
    it 'returns a team member' do
      VCR.use_cassette('get_team_member') do
        expect(Insightly2.client.get_team_member(id: team_member_id)).to be_a(TeamMember)
      end
    end
  end

  # GET /v2.1/TeamMembers?teamid={teamid}
  describe '#get_team_members' do
    it 'returns an array of team_members' do
      VCR.use_cassette('get_team_members') do
        team_members = Insightly2.client.get_team_members(team_id: team_id)
        expect(team_members).to be_a(Array)
        expect(team_members.first).to be_a(TeamMember)
      end
    end
  end

  # POST /v2.1/TeamMembers
  describe '#create_team_member' do
    it 'creates and returns a team_member' do
      VCR.use_cassette('create_team_member') do
        team_member = Insightly2.client.get_team_member(id: team_member_id)
        expect(Insightly2.client.create_team_member(team_member: team_member)).to be_a(TeamMember)
      end
    end
  end

  # PUT /v2.1/TeamMembers
  describe '#update_team_member' do
    it 'updates and returns a team_member' do
      VCR.use_cassette('update_team_member') do
        team_member = Insightly2.client.get_team_member(id: team_member_id)
        expect(Insightly2.client.update_team_member(team_member: team_member)).to be_a(TeamMember)
      end
    end
  end

  # DELETE /v2.1/TeamMembers/{id}
  describe '#delete_team_member' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_team_member') do
        response = Insightly2.client.delete_team_member(id: team_member_id)
        expect(response.status).to eq(202)
      end
    end
  end
end