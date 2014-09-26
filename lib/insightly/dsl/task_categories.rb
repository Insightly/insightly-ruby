require 'insightly/dsl'

module Insightly
  module DSL::TaskCategories
    # GET /v2.1/TaskCategories/{id}
    # Get a task category.
    # @param [String, Fixnum] id A TaskCategory's ID.
    # @return [Insightly::Resources::TaskCategory, nil].
    def get_task_category(id:)
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
    # @param [Hash] task_category The task category to create.
    # @return [Insightly::Resources::TaskCategory, nil].
    def create_task_category(task_category:)
      Resources::TaskCategory.parse(request(:post, "TaskCategories", task_category))
    end

    # PUT /v2.1/TaskCategories
    # Updates a task category.
    # @param [Hash] task_category The task category to update.
    # @return [Insightly::Resources::TaskCategory, nil].
    def update_task_category(task_category:)
      Resources::TaskCategory.parse(request(:put, "TaskCategories", task_category))
    end

    # DELETE /v2.1/TaskCategories/{id}
    # Delete a task category.
    # @param [String, Fixnum] id A TaskCategory's ID
    # @return [RestClient::Response].
    def delete_task_category(id:)
      request(:delete, "TaskCategories/#{id}")
    end
  end
end
