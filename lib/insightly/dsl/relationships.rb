require 'insightly/dsl'

module Insightly
  module DSL::Relationships
    # GET /v2.1/Relationships
    # Get a list of relationships.
    # @return [Array, nil].
    def get_relationships
      Resources::Relationship.parse(request(:get, "Relationships"))
    end
  end
end
