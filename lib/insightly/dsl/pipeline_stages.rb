require 'insightly/dsl'

module Insightly
  module DSL::PipelineStages
    # GET /v2.1/PipelineStages
    # @return [<Insightly::Resources::PipelineStage>, nil]
    def get_pipeline_stages
      Resources::PipelineStage.parse(request(:get, 'PipelineStages'))
    end

    # GET /v2.1/PipelineStages/{id}
    # @return [Insightly::Resources::PipelineStage]
    # @param [String, Fixnum] id A PipelineStage's ID
    def get_pipeline_stage(id)
      Resources::PipelineStage.parse(request(:get, "PipelineStages/#{id}"))
    end
  end
end
