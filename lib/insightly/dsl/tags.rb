require 'insightly/dsl'

module Insightly
  module DSL::Tags
    # GET /v2.1/Tags/{id}
    # @return [Insightly::Resources::Tag]
    # @param [String, Fixnum] id A Tag's ID
    def get_tag(id)
      Resources::Tag.parse(request(:get, "Tags/#{id}"))
    end
  end
end
