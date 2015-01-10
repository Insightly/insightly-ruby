require 'spec_helper'

describe Insightly2::DSL::Users do
  let(:user_id) { 607181 }

  # GET /v2.1/Users/{id}
  describe '#get_user' do
    it 'returns a user' do
      VCR.use_cassette('get_user') do
        expect(Insightly2.client.get_user(id: user_id)).to be_a(User)
      end
    end
  end

  # GET /v2.1/Users
  describe '#get_users' do
    it 'returns an array of users' do
      VCR.use_cassette('get_users') do
        users = Insightly2.client.get_users
        expect(users).to be_a(Array)
        expect(users.first).to be_a(User)
      end
    end
  end
end
