require 'spec_helper'

describe Insightly2::DSL::Opportunities do
  # GET /v2.1/OpportunityStateReasons
  describe '#get_opportunity_state_reasons' do
    it 'returns an array of opportunity_state_reasons' do
      VCR.use_cassette('get_opportunity_state_reasons') do
        opportunity_state_reasons = Insightly2.client.get_opportunity_state_reasons
        expect(opportunity_state_reasons).to be_a(Array)
        expect(opportunity_state_reasons.first).to be_a(OpportunityStateReason)
      end
    end
  end
end