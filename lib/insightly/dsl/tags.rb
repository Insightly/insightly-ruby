require 'insightly/dsl'

module Insightly
  module DSL::Tags
    # GET /v2.1/Tags/{id}
    # Get a tag.
    # @param [String, Fixnum] id A Tag's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Tag, nil].
    def get_tag(id)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Tag.parse(request(:get, "Tags/#{id}"))
    end
  end
end
