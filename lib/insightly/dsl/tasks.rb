require 'insightly/dsl'

module Insightly
  module DSL::Tasks
    # DELETE /v2.1/Tasks/{id}
    # @param [String, Fixnum] id A Task's ID
    def delete_task(id:)
      request(:delete, "Tasks/#{id}")
    end

    # GET /v2.1/Tasks/{c_id}/Comments
    # @param [String, Fixnum] id A Task's ID
    # @return [Array, nil]
    def get_task_comments(id:)
      Resources::Task.parse(request(:get, "Tasks/#{id}/Comments"))
    end

    # GET /v2.1/Tasks/{id}
    # @param [String, Fixnum] id A Task's ID
    # @return [Insightly::Resources::Task, nil]
    def get_task(id:)
      Resources::Task.parse(request(:get, "Tasks/#{id}"))
    end

    # GET /v2.1/Tasks?ids={ids}
    # @param [ids:] Array of task ids (optional)
    # @return [<Insightly::Resources::Task>, nil]
    def get_tasks(ids: [])
      Resources::Task.parse(request(:get, "Tasks/?ids=#{ids}"))
    end

    # POST /v2.1/Tasks
    # @param [Hash] task: Hash of task attributes
    def create_task(task:)
      Resources::Task.parse(request(:post, "Tasks", task))
    end

    # POST /v2.1/Tasks/{c_id}/Comments
    # @param [String, Fixnum] id A Task's ID
    # @param [Hash] comment The comment to create
    def create_task_comments(id:, comment:)
      Resources::Task.parse(request(:post, "Tasks/#{c_id}/Comments", comment))
    end

    # PUT /v2.1/Tasks
    # @param [Hash] task The task to update
    def update_task(task:)
      Resources::Task.parse(request(:put, "Tasks", task))
    end
  end
end
