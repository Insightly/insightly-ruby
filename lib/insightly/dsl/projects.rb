require 'insightly/dsl'

module Insightly
  module DSL::Projects
    # GET /v2.1/Projects/{id}
    # Get a project.
    # @param [String, Fixnum] id A project's ID..
    # @return [Insightly::Resources::Project, nil].
    def get_project(id:)
      Resources::Project.parse(request(:get, "Projects/#{id}"))
    end

    # GET /v2.1/Projects/{c_id}/Emails
    # Get a list of project emails.
    # @param [String, Fixnum] id A project's ID.
    # @return [Array, nil].
    def get_project_emails(id:)
      Resources::Email.parse(request(:get, "Projects/#{id}/Emails"))
    end

    # GET /v2.1/Projects/{c_id}/Image
    # Get a project image.
    # @param [String, Fixnum] id A project's ID.
    # @return [Insightly::Resources::Project].
    # TODO - What does this return?
    # def get_project_image(id:)
    #   Resources::Project.parse(request(:get, "Projects/#{id}/Image"))
    # end

    # GET /v2.1/Projects/{c_id}/Notes
    # Get a projects notes.
    # @param [String, Fixnum] id A project's ID.
    # @return [Array, nil].
    def get_project_notes(id:)
      Resources::Note.parse(request(:get, "Projects/#{id}/Notes"))
    end

    # GET /v2.1/Projects/{c_id}/Tasks
    # Get a project tasks.
    # @param [String, Fixnum] id A project's ID.
    # @return [Array, nil].
    def get_project_tasks(id:)
      Resources::Task.parse(request(:get, "Projects/#{id}/Tasks"))
    end

    # GET /v2.1/Projects?ids={ids}&tag={tag}
    # Get a list of projects.
    # @param [Array] ids The IDs of the projects to retrieve (optional).
    # @param [String] tag The tag that is applied to the projects (optional).
    # @return [Array, nil].
    def get_projects(ids: [], tag: '')
      ids = ids.join(',')
      Resources::Project.parse(request(:get, "Projects?ids=#{ids}&tag=#{tag}"))
    end

    # POST /v2.1/Projects
    # Create a project.
    # @param [Hash] project The project to create.
    # @return [Insightly::Resources::Project, nil].
    def create_project(project:)
      Resources::Project.parse(request(:post, "Projects", project))
    end

    # POST /v2.1/Projects/{c_id}/Image/{filename}
    # Create a project image.
    # @param [String, Fixnum] id A project's ID.
    # @param [String] filename A Project image file name
    # @return [RestClient::Response].
    def create_project_image(id:, filename:)
      request(:post, "Projects/#{id}/Image/#{filename}")
    end

    # PUT /v2.1/Projects
    # Update a project.
    # @param [Hash] project The project to update.
    # @return [Insightly::Resources::Project, nil].
    def update_project(project:)
      Resources::Project.parse(request(:put, "Projects", project))
    end

    # PUT /v2.1/Projects/{c_id}/Image/{filename}
    # Update a project's image.
    # @param [String, Fixnum] id A project's ID.
    # @param [String] filename A project image file name.
    # @return [RestClient::Response].
    def update_project_image(id:, filename:)
      request(:put, "Projects/#{id}/Image/#{filename}")
    end

    # DELETE /v2.1/Projects/{id}
    # Delete a project.
    # @param [String, Fixnum] id A project's ID.
    # @return [RestClient::Response].
    def delete_project(id:)
      request(:delete, "Projects/#{id}")
    end

    # DELETE /v2.1/Projects/{c_id}/Image
    # Delete a project image.
    # @param [String, Fixnum] id A project's ID.
    # @return [RestClient::Response].
    def delete_project_image(id:)
      request(:delete, "Projects/#{id}/Image")
    end
  end
end
