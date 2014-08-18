require 'insightly/dsl'

module Insightly
  module DSL::Tasks
    # DELETE /v2.1/Tasks/{id}
    # @param [String, Fixnum] id A Task's ID
    def delete_task(id)
      request(:delete, "Tasks/#{id}")
    end

    # GET /v2.1/Tasks/{c_id}/Comments

    # GET /v2.1/Tasks/{id}
    # @return [Insightly::Resources::Task]
    # @param [String, Fixnum] id A Task's ID
    def get_task(id)
      Resources::Task.parse(request(:get, "Tasks/#{id}"))
    end

    # GET /v2.1/Tasks?ids={ids}
    # @return [<Insightly::Resources::Task>, nil]
    def get_tasks
      Resources::Task.parse(request(:get, 'Tasks'))
    end

    # POST /v2.1/Tasks

    # POST /v2.1/Tasks/{c_id}/Comments

    # PUT /v2.1/Tasks
  end
end
