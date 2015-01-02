require 'spec_helper'

describe Insightly2::DSL::CustomFields do
  let(:custom_field_id) { 'CONTACT_FIELD_1' }

  # GET /v2.1/CustomFields/{id}
  describe '#get_custom_field' do
    it 'returns a custom field' do
      VCR.use_cassette('get_custom_field') do
        expect(Insightly2.client.get_custom_field(id: custom_field_id)).to be_a(CustomField)
      end
    end
  end

  # GET /v2.1/CustomFields
  describe '#get_custom_fields' do
    it 'returns an array of custom fields' do
      VCR.use_cassette('get_custom_fields') do
        custom_fields = Insightly2.client.get_custom_fields
        expect(custom_fields).to be_a(Array)
        expect(custom_fields.first).to be_a(CustomField)
      end
    end
  end
end