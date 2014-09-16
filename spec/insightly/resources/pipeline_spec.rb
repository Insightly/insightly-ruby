require 'spec_helper'

describe Insightly::Resources::Pipeline do
  subject(:pipeline) { Insightly.client.get_pipeline(1) }

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