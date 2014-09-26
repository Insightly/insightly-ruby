require 'insightly/dsl'

module Insightly
  module DSL::Countries
    # GET /v2.1/Countries
    # Get a list of countries.
    # @return [Array, nil].
    def get_countries
      Resources::Country.parse(request(:get, "Countries"))
    end
  end
end
