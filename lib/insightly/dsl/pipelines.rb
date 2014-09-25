require 'insightly/dsl'

module Insightly
  module DSL::Pipelines
    # GET /v2.1/Pipelines/{id}
    # Get a pipeline.
    # @param [String, Fixnum] id A pipeline's ID.
    # @return [Insightly::Resources::Pipeline, nil].
    def get_pipeline(id:)
      Resources::Pipeline.parse(request(:get, "Pipelines/#{id}"))
    end

    # GET /v2.1/Pipelines
    # Get a list of pipelines.
    # @return [Insightly::Resources::Pipeline, nil].
    def get_pipelines
      Resources::Pipeline.parse(request(:get, 'Pipelines'))
    end
  end
end
