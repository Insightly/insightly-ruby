require 'insightly/dsl'

module Insightly
  module DSL::ProjectCategories
    # GET /v2.1/ProjectCategories/{id}
    # Get a project category.
    # @param [String, Fixnum] id A project category's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::ProjectCategory, nil].
    def get_project_category(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::ProjectCategory.parse(request(:get, "ProjectCategories/#{id}"))
    end

    # GET /v2.1/ProjectCategories
    # Get a list of project categories.
    # @return [Array, nil].
    def get_project_categories
      Resources::ProjectCategory.parse(request(:get, "ProjectCategories"))
    end

    # POST /v2.1/ProjectCategories
    # Create a project category.
    # @param [Hash] category: The project category to create.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::ProjectCategory, nil].
    def create_project_category(category:)
      raise ArgumentError, "Category cannot be nil" if category.nil?
      Resources::ProjectCategory.parse(request(:post, "ProjectCategories", category))
    end

    # PUT /v2.1/ProjectCategories
    # Update a project category.
    # @param [Hash] category The project category to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::ProjectCategory, nil]
    def update_project_category(category:)
      raise ArgumentError, "Category cannot be nil" if category.nil?
      Resources::ProjectCategory.parse(request(:put, "ProjectCategories", category))
    end

    # DELETE /v2.1/ProjectCategories/{id}
    # Delete a project category.
    # @param [String, Fixnum] id A project category's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_project_category(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "ProjectCategories/#{id}")
    end
  end
end
