require 'insightly/dsl'

module Insightly
  module DSL::Tags
    # GET /v2.1/Tags/{id}
    # Get a tag.
    # @param [String, Fixnum] id A Tag's ID.
    # @return [Insightly::Resources::Tag, nil].
    def get_tag(id)
      Resources::Tag.parse(request(:get, "Tags/#{id}"))
    end
  end
end
