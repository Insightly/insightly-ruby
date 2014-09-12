require 'spec_helper'

describe Insightly::DSL::CustomFields do
  # GET /v2.1/CustomFields

  # GET /v2.1/CustomFields/{id}
  describe '#get_contact' do
    it 'returns a custom field' do
      expect(Insightly.client.get_custom_field(1)).to be_a(Insightly::Resources::CustomField)
    end
  end
end