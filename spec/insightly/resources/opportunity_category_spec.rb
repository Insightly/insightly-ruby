require 'spec_helper'

describe Insightly::Resources::OpportunityCategory do
  subject(:opportunity_category) do
    VCR.use_cassette('get_opportunity_category') do
      Insightly.client.get_opportunity_category(id: 2175382)
    end
  end

  describe 'instance' do
    it 'is decorated with OpportunityCategory object' do
      expect(subject).to be_a(described_class)
    end

    %w(category_id category_name active background_color).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end