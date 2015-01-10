require 'spec_helper'

describe Insightly2::Resources::Pipeline do
  subject(:pipeline) do
    VCR.use_cassette('get_pipeline') do
      Insightly2.client.get_pipeline(id: 124170)
    end
  end

  describe 'instance' do
    it 'is decorated with Pipeline object' do
      expect(subject).to be_a(described_class)
    end

    %w(pipeline_id pipeline_name for_opportunities for_projects owner_user_id).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end