require 'spec_helper'

describe Insightly::DSL::Teams do
  # GET /v2.1/Teams/{id}
  describe '#get_team' do
    it 'returns a team' do
      expect(Insightly.client.get_team(id: 1)).to be_a(Team)
    end
  end

  # GET /v2.1/Teams
  describe '#get_teams' do
    it 'returns an array of teams' do
      teams = Insightly.client.get_teams
      expect(teams).to be_a(Array)
      expect(teams.first).to be_a(Team)
    end
  end

  # POST /v2.1/Teams
  describe '#create_team' do
    it 'returns a team' do
      expect(Insightly.client.create_team(team: {team_name: ''})).to be_a(Team)
    end
  end

  # PUT /v2.1/Teams
  describe '#create_team' do
    it 'returns a team' do
      expect(Insightly.client.create_team(team: {team_name: ''})).to be_a(Team)
    end
  end

  # DELETE /v2.1/Teams/{id}
  describe '#delete_team' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_team(id: 1)
      expect(response.code).to eq(202)
    end
  end
end