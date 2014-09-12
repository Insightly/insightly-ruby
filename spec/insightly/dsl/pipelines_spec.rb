require 'spec_helper'

describe Insightly::DSL::Pipelines do
  # GET /v2.1/Pipelines

  # GET /v2.1/Pipelines/{id}
  describe '#get_pipeline' do
    it 'returns a pipeline' do
      expect(Insightly.client.get_pipeline_stage(1)).to be_a(Insightly::Resources::PipelineStage)
    end
  end
end