require 'spec_helper'

describe Insightly::DSL::Users do
  # GET /v2.1/Users/{id}
  describe '#get_user' do
    it 'returns a user' do
      expect(Insightly.client.get_user(id: 1)).to be_a(User)
    end
  end

  # GET /v2.1/Users
  describe '#get_users' do
    it 'returns an array of users' do
      users = Insightly.client.get_users
      expect(users).to be_a(Array)
      expect(users.first).to be_a(User)
    end
  end
end
