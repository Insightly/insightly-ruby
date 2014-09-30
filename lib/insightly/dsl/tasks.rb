require 'insightly/dsl'

module Insightly
  module DSL::Tasks
    # GET /v2.1/Tasks/{id}
    # Get a task.
    # @param [String, Fixnum] id A Task's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Task, nil].
    def get_task(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Task.parse(request(:get, "Tasks/#{id}"))
    end

    # GET /v2.1/Tasks/{c_id}/Comments
    # Get a list of comments for a task.
    # @param [String, Fixnum] id A Task's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Array, nil].
    def get_task_comments(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      Resources::Comment.parse(request(:get, "Tasks/#{id}/Comments"))
    end

    # GET /v2.1/Tasks?ids={ids}
    # Get a list of tasks.
    # @param [ids:] Array of task ids (optional).
    # @return [Insightly::Resources::Task, nil].
    def get_tasks(ids: [])
      ids = ids.join(',')
      Resources::Task.parse(request(:get, "Tasks/?ids=#{ids}"))
    end

    # POST /v2.1/Tasks
    # Create a task.
    # @param [Hash] task The task to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Task, nil].
    def create_task(task:)
      raise ArgumentError, "Task cannot be blank" if task.blank?
      Resources::Task.parse(request(:post, "Tasks", task))
    end

    # POST /v2.1/Tasks/{c_id}/Comments
    # Create a comment for a task.
    # @param [String, Fixnum] id A task's ID.
    # @param [Hash] comment The comment to create.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Comment, nil].
    def create_task_comments(id:, comment:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      raise ArgumentError, "Comment cannot be blank" if comment.blank?
      Resources::Comment.parse(request(:post, "Tasks/#{id}/Comments", comment))
    end

    # PUT /v2.1/Tasks
    # Update a task.
    # @param [Hash] task The task to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly::Resources::Comment, nil].
    def update_task(task:)
      raise ArgumentError, "Task cannot be blank" if task.blank?
      Resources::Task.parse(request(:put, "Tasks", task))
    end

    # DELETE /v2.1/Tasks/{id}
    # Delete a task.
    # @param [String, Fixnum] id A Task's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [RestClient::Response].
    def delete_task(id:)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:delete, "Tasks/#{id}")
    end
  end
end
