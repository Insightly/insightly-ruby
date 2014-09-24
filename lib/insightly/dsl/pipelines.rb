require 'insightly/dsl'

module Insightly
  module DSL::Pipelines
    # GET /v2.1/Pipelines
    # @return [<Insightly::Resources::Pipeline>, nil]
    def get_pipelines
      Resources::Pipeline.parse(request(:get, 'Pipelines'))
    end

    # GET /v2.1/Pipelines/{id}
    # @return [Insightly::Resources::Pipeline]
    # @param [String, Fixnum] id A Pipeline's ID
    def get_pipeline(id:)
      Resources::Pipeline.parse(request(:get, "Pipelines/#{id}"))
    end
  end
end
