require 'spec_helper'

describe Insightly2::Resources::PipelineStage do
  subject(:pipeline_stage) do
    VCR.use_cassette('get_pipeline_stage') do
      Insightly2.client.get_pipeline_stage(id: 377384)
    end
  end

  describe 'instance' do
    it 'is decorated with PipelineStage object' do
      expect(subject).to be_a(described_class)
    end

    %w(pipeline_id stage_id stage_name stage_order owner_user_id).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end