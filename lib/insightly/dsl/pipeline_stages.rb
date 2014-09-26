require 'insightly/dsl'

module Insightly
  module DSL::PipelineStages
    # GET /v2.1/PipelineStages/{id}
    # Get a pipeline stage.
    # @param [String, Fixnum] id A pipeline stage's ID.
    # @return [Insightly::Resources::PipelineStage, nil].
    def get_pipeline_stage(id:)
      Resources::PipelineStage.parse(request(:get, "PipelineStages/#{id}"))
    end

    # GET /v2.1/PipelineStages
    # Get a list of pipeline stages.
    # @return [Array, nil]
    def get_pipeline_stages
      Resources::PipelineStage.parse(request(:get, 'PipelineStages'))
    end
  end
end
