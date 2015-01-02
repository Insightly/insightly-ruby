require 'insightly2/dsl'

module Insightly2
  module DSL::Tags
    # GET /v2.1/Tags/{id}
    # Get a tag.
    # @param [String, Fixnum] id A Tag's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Tag, nil].
    def get_tag(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Tag.parse(request(:get, "Tags/#{id}"))
    end
  end
end
