require 'spec_helper'

describe Insightly::DSL::PipelineStages do
  # GET /v2.1/PipelineStages

  # GET /v2.1/PipelineStages/{id}
  describe '#get_pipeline_stage' do
    it 'returns a pipeline stage' do
      expect(Insightly.client.get_pipeline_stage(1)).to be_a(Insightly::Resources::PipelineStage)
    end
  end
end