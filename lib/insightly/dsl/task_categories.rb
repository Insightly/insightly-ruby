require 'insightly/dsl'

module Insightly
  module DSL::TaskCategories
    # GET /v2.1/TaskCategories/{id}
    # Get a task category.
    # @param [String, Fixnum] id A task category's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::TaskCategory, nil].
    def get_task_category(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::TaskCategory.parse(request(:get, "TaskCategories/#{id}"))
    end

    # GET /v2.1/TaskCategories
    # Get a list of task categories.
    # @return [Insightly::Resources::TaskCategory, nil].
    def get_task_categories
      Resources::TaskCategory.parse(request(:get, "TaskCategories"))
    end

    # POST /v2.1/TaskCategories
    # Creates a task category.
    # @param [Hash] category The task category to create.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::TaskCategory, nil].
    def create_task_category(category:)
      raise ArgumentError, "Category cannot be nil" if category.nil?
      Resources::TaskCategory.parse(request(:post, "TaskCategories", category))
    end

    # PUT /v2.1/TaskCategories
    # Updates a task category.
    # @param [Hash] category The task category to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::TaskCategory, nil].
    def update_task_category(category:)
      raise ArgumentError, "Category cannot be nil" if category.nil?
      Resources::TaskCategory.parse(request(:put, "TaskCategories", category))
    end

    # DELETE /v2.1/TaskCategories/{id}
    # Delete a task category.
    # @param [String, Fixnum] id A task category's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_task_category(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "TaskCategories/#{id}")
    end
  end
end
