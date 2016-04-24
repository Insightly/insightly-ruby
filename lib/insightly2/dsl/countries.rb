require 'insightly2/dsl'

module Insightly2
  module DSL::Countries
    # GET /v2.1/Countries
    # Get a list of countries.
    # @return [Array, nil].
    def get_countries
      Resources::Country.parse(request(:get, 'Countries'))
    end
  end
end
