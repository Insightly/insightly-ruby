require 'insightly/dsl'

module Insightly
  module DSL::Projects
    # DELETE /v2.1/Projects/{c_id}/Image
    # @param [String, Fixnum] id A Project's ID
    def delete_project_image(id:)
      request(:delete, "Projects/#{id}/Image")
    end

    # DELETE /v2.1/Projects/{id}
    # @param [String, Fixnum] id A Project's ID
    def delete_project(id:)
      request(:delete, "Projects/#{id}")
    end

    # GET /v2.1/Projects/{c_id}/Emails
    # @return [Insightly::Resources::Project]
    # @param [String, Fixnum] id A Project's ID
    def get_project_emails(id:)
      Resources::Project.parse(request(:get, "Projects/#{id}/Emails"))
    end

    # GET /v2.1/Projects/{c_id}/Image
    # @return [Insightly::Resources::Project]
    # @param [String, Fixnum] id A Project's ID
    def get_project_image(id:)
      Resources::Project.parse(request(:get, "Projects/#{id}/Image"))
    end

    # GET /v2.1/Projects/{c_id}/Notes
    # @return [Insightly::Resources::Project]
    # @param [String, Fixnum] id A Project's ID
    def get_project_notes(id:)
      Resources::Project.parse(request(:get, "Projects/#{id}/Notes"))
    end

    # GET /v2.1/Projects/{c_id}/Tasks
    # @return [Insightly::Resources::Project]
    # @param [String, Fixnum] id A Project's ID
    def get_project_tasks(id:)
      Resources::Project.parse(request(:get, "Projects/#{id}/Tasks"))
    end

    # GET /v2.1/Projects/{id}
    # @return [Insightly::Resources::Project]
    # @param [String, Fixnum] id A Project's ID
    def get_project(id:)
      Resources::Project.parse(request(:get, "Projects/#{id}"))
    end

    # GET /v2.1/Projects?ids={ids}&tag={tag}
    # @param [Array] ids Project's IDs
    # @param [String] tag A single tag
    # @return [<Insightly::Resources::Project>, nil]
    def get_projects(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Project.parse(request(:get, "Projects?ids=#{ids}&tag=#{tag}"))
    end

    # POST /v2.1/Projects
    # @return [Insightly::Resources::Project]
    # @param [Hash] project A Hash of project attributes
    def create_project(project:)
      Resources::Project.parse(request(:post, "Projects", project))
    end

    # POST /v2.1/Projects/{c_id}/Image/{filename}
    # @param [String, Fixnum] id A Project's ID
    # @param [String] filename A Project image file name
    def create_project_image(id:, filename:)
      request(:post, "Projects/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Projects
    # @return [Insightly::Resources::Project]
    # @param [Hash] project A Hash of project attributes
    def update_project(project:)
      Resources::Project.parse(request(:put, "Projects", project))
    end

    # PUT /v2.1/Projects/{c_id}/Image/{filename}
    # @param [String, Fixnum] id A Project's ID
    # @param [String] filename A Project image file name
    def update_project_image(id:, filename:)
      request(:put, "Projects/#{id}/Image/#{filename}")
    end
  end
end
