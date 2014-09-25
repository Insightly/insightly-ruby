require 'insightly/dsl'

module Insightly
  module DSL::ProjectCategories
    # DELETE /v2.1/ProjectCategories/{id}
    # @param [String, Fixnum] id A ProjectCategory's ID
    def delete_project_category(id:)
      request(:delete, "ProjectCategories/#{id}")
    end

    # GET /v2.1/ProjectCategories
    # @return [<Insightly::Resources::ProjectCategory>, nil]
    def get_project_categories
      Resources::ProjectCategory.parse(request(:get, 'ProjectCategories'))
    end

    # GET /v2.1/ProjectCategories/{id}
    # @return [Insightly::Resources::ProjectCategory]
    # @param [String, Fixnum] id A ProjectCategory's ID
    def get_project_category(id:)
      Resources::ProjectCategory.parse(request(:get, "ProjectCategories/#{id}"))
    end

    # POST /v2.1/ProjectCategories
    # @param [Hash] category: A Hash of project category attributes.
    # @return [Insightly::Resources::ProjectCategory]
    def create_project_category(category:)
      Resources::ProjectCategory.parse(request(:post, "ProjectCategories", category))
    end

    # PUT /v2.1/ProjectCategories
    # @param [Hash] category: A Hash of project category attributes.
    # @return [Insightly::Resources::ProjectCategory]
    def update_project_category(category:)
      Resources::ProjectCategory.parse(request(:put, "ProjectCategories", category))
    end
  end
end
