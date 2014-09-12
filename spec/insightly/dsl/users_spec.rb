require 'spec_helper'

describe Insightly::DSL::Users do
  # GET /v2.1/Users

  # GET /v2.1/Users/{id}
  describe '#get_user' do
    it 'returns a user' do
      expect(Insightly.client.get_user(1)).to be_a(Insightly::Resources::User)
    end
  end
end
