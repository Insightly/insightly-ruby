require 'spec_helper'

describe Insightly2::Resources::LeadSource do
  subject(:lead_source) do
    VCR.use_cassette('get_lead_sources') do
      Insightly2.client.get_lead_sources.first
    end
  end

  describe 'instance' do
    it 'is decorated with LeadSource object' do
      expect(subject).to be_a(described_class)
    end

    %w(lead_source_id lead_source default_value field_order).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end
