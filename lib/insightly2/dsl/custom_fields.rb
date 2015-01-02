require 'insightly2/dsl'

module Insightly2
  module DSL::CustomFields
    # GET /v2.1/CustomFields/{id}
    # Get a custom field.
    # @param [String, Fixnum] id A CustomField's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::CustomField, nil].
    def get_custom_field(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
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
