require 'spec_helper'

describe Insightly::Resources::PipelineStage do
  subject(:pipeline_stage) { Insightly.client.get_pipeline_stage(1) }

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