require 'spec_helper'

describe Insightly::DSL::PipelineStages do
  # GET /v2.1/PipelineStages
  describe '#get_pipeline_stages' do
    it 'returns an array of pipeline_stages' do
      pipeline_stages = Insightly.client.get_pipeline_stages
      expect(pipeline_stages).to be_a(Array)
      expect(pipeline_stages.first).to be_a(PipelineStage)
    end
  end
  
  # GET /v2.1/PipelineStages/{id}
  describe '#get_pipeline_stage' do
    it 'returns a pipeline stage' do
      expect(Insightly.client.get_pipeline_stage(1)).to be_a(PipelineStage)
    end
  end
end