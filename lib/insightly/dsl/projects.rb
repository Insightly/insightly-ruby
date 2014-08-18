require 'insightly/dsl'

module Insightly
  module DSL::Projects
    # DELETE /v2.1/Projects/{c_id}/Image

    # DELETE /v2.1/Projects/{id}
    # @param [String, Fixnum] id A Project's ID
    def delete_project(id)
      request(:delete, "Projects/#{id}")
    end

    # GET /v2.1/Projects/{c_id}/Emails

    # GET /v2.1/Projects/{c_id}/Image

    # GET /v2.1/Projects/{c_id}/Notes

    # GET /v2.1/Projects/{c_id}/Tasks

    # GET /v2.1/Projects/{id}
    # @return [Insightly::Resources::Project]
    # @param [String, Fixnum] id A Project's ID
    def get_project(id)
      Resources::Project.parse(request(:get, "Projects/#{id}"))
    end

    # GET /v2.1/Projects?ids={ids}&tag={tag}
    # @return [<Insightly::Resources::Project>, nil]
    def get_projects
      Resources::Project.parse(request(:get, 'Projects'))
    end

    # POST /v2.1/Projects

    # POST /v2.1/Projects/{c_id}/Image/{filename}

    # PUT /v2.1/Projects

    # PUT /v2.1/Projects/{c_id}/Image/{filename}
  end
end
