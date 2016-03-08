require 'spec_helper'

describe Insightly2::Resources::LeadStatus do
  subject(:lead_status) do
    VCR.use_cassette('get_lead_statuses') do
      Insightly2.client.get_lead_statuses.first
    end
  end

  describe 'instance' do
    it 'is decorated with LeadStatus object' do
      expect(subject).to be_a(described_class)
    end

    %w(lead_status_id lead_status default_status status_type field_order).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end
