require 'insightly/dsl'

module Insightly
  module DSL::TaskCategories
    # DELETE /v2.1/TaskCategories/{id}
    # @param [String, Fixnum] id A TaskCategory's ID
    def delete_task_category(id:)
      request(:delete, "TaskCategories/#{id}")
    end

    # GET /v2.1/TaskCategories
    # @return [<Insightly::Resources::TaskCategory>, nil]
    def get_task_categories
      Resources::TaskCategory.parse(request(:get, 'TaskCategories'))
    end

    # GET /v2.1/TaskCategories/{id}
    # @return [Insightly::Resources::TaskCategory]
    # @param [String, Fixnum] id A TaskCategory's ID
    def get_task_category(id:)
      Resources::TaskCategory.parse(request(:get, "TaskCategories/#{id}"))
    end

    # POST /v2.1/TaskCategories
    # Creates a task category.
    # @param [Hash] task_category A hash of task category attributes.
    def create_task_category(task_category:)
      Resources::TaskCategory.parse(request(:post, "TaskCategories", task_category))
    end

    # PUT /v2.1/TaskCategories
    # Updates a task category.
    # @param [Hash] task_category A hash of task_category attributes.
    def update_task_category(task_category:)
      Resources::TaskCategory.parse(request(:put, "TaskCategories", task_category))
    end
  end
end
