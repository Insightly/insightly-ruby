require 'spec_helper'

describe Insightly::DSL::CustomFields do
  # GET /v2.1/CustomFields/{id}
  describe '#get_custom_field' do
    it 'returns a custom field' do
      expect(Insightly.client.get_custom_field(id: 1)).to be_a(CustomField)
    end
  end

  # GET /v2.1/CustomFields
  describe '#get_custom_fields' do
    it 'returns an array of custom fields' do
      custom_fields = Insightly.client.get_custom_fields
      expect(custom_fields).to be_a(Array)
      expect(custom_fields.first).to be_a(CustomField)
    end
  end
end