require 'insightly/dsl'

module Insightly
  module DSL::TaskCategories
    # DELETE /v2.1/TaskCategories/{id}
    # @param [String, Fixnum] id A TaskCategory's ID
    def delete_task_category(id)
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
    def get_task_category(id)
      Resources::TaskCategory.parse(request(:get, "TaskCategories/#{id}"))
    end

    # POST /v2.1/TaskCategories

    # PUT /v2.1/TaskCategories
  end
end
