require 'insightly/dsl'

module Insightly
  module DSL::Pipelines
    # GET /v2.1/Pipelines/{id}
    # Get a pipeline.
    # @param [String, Fixnum] id A pipeline's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Pipeline, nil].
    def get_pipeline(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Pipeline.parse(request(:get, "Pipelines/#{id}"))
    end

    # GET /v2.1/Pipelines
    # Get a list of pipelines.
    # @return [Insightly::Resources::Pipeline, nil].
    def get_pipelines
      Resources::Pipeline.parse(request(:get, "Pipelines"))
    end
  end
end
