require 'insightly/dsl'

module Insightly
  module DSL::OpportunityStateReasons
    # GET /v2.1/OpportunityStateReasons
    # Get a list of opportunity state reasons.
    # @return [Array, nil]
    def get_opportunity_state_reasons
      Resources::OpportunityStateReason.parse(request(:get, 'OpportunityStateReasons'))
    end
  end
end
