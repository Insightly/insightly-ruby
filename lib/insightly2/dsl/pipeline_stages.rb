require 'insightly2/dsl'

module Insightly2
  module DSL::PipelineStages
    # GET /v2.1/PipelineStages/{id}
    # Get a pipeline stage.
    # @param [String, Fixnum] id A pipeline stage's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::PipelineStage, nil].
    def get_pipeline_stage(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
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
