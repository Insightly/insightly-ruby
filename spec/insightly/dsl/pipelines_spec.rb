require 'spec_helper'

describe Insightly2::DSL::Pipelines do
  let(:pipeline_id) { 124170 }

  # GET /v2.1/Pipelines/{id}
  describe '#get_pipeline' do
    it 'returns a pipeline' do
      VCR.use_cassette('get_pipeline') do
        expect(Insightly2.client.get_pipeline(id: pipeline_id)).to be_a(Pipeline)
      end
    end
  end

  # GET /v2.1/Pipelines
  describe '#get_pipelines' do
    it 'returns an array of pipelines' do
      VCR.use_cassette('get_pipelines') do
        pipelines = Insightly2.client.get_pipelines
        expect(pipelines).to be_a(Array)
        expect(pipelines.first).to be_a(Pipeline)
      end
    end
  end
end