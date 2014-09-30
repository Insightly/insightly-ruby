require 'insightly/dsl'

module Insightly
  module DSL::PipelineStages
    # GET /v2.1/PipelineStages/{id}
    # Get a pipeline stage.
    # @param [String, Fixnum] id A pipeline stage's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::PipelineStage, nil].
    def get_pipeline_stage(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
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
