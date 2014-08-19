require 'insightly/dsl'

module Insightly
  module DSL::CustomFields
    # GET /v2.1/CustomFields
    # @return [<Insightly::Resources::CustomField>, nil]
    def get_custom_fields
      Resources::CustomField.parse(request(:get, 'CustomFields'))
    end

    # GET /v2.1/CustomFields/{id}
    # @return [Insightly::Resources::CustomField]
    # @param [String, Fixnum] id A CustomField's ID
    def get_custom_field(id)
      Resources::CustomField.parse(request(:get, "CustomFields/#{id}"))
    end
  end
end
