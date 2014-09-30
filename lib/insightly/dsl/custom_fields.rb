require 'insightly/dsl'

module Insightly
  module DSL::CustomFields
    # GET /v2.1/CustomFields/{id}
    # Get a custom field.
    # @param [String, Fixnum] id A CustomField's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::CustomField, nil].
    def get_custom_field(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::CustomField.parse(request(:get, "CustomFields/#{id}"))
    end

    # GET /v2.1/CustomFields
    # Get a list of custom fields.
    # @return [Array, nil].
    def get_custom_fields
      Resources::CustomField.parse(request(:get, "CustomFields"))
    end
  end
end
