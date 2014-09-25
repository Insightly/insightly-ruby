require 'insightly/dsl'

module Insightly
  module DSL::Currencies
    # GET /v2.1/Currencies
    # Get a list of currencies.
    # @return [Array, nil].
    def get_currencies
      Resources::Currency.parse(request(:get, "Currencies"))
    end
  end
end
