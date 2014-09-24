require 'spec_helper'

describe Insightly::DSL::Tasks do
  # DELETE /v2.1/Tasks/{id}
  describe '#delete_task' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_task(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/Tasks/{c_id}/Comments
  describe '#get_comment_tasks' do
    xit 'returns an array of task comments' do
      comments = Insightly.client.get_task_comments(c_id: 1)
      expect(comments).to be_a(Array)
      expect(comments.first).to be_a(Insightly::Resources::Comment)
    end
  end

  # GET /v2.1/Tasks/{id}
  describe '#get_task' do
    it 'returns a task' do
      expect(Insightly.client.get_task(id: 1)).to be_a(Insightly::Resources::Task)
    end
  end

  # GET /v2.1/Tasks?ids={ids}
  describe '#get_tasks' do
    xit 'returns an array of tasks' do
      tasks = Insightly.client.get_tasks
      expect(tasks).to be_a(Array)
      expect(tasks.first).to be_a(Insightly::Resources::Task)
    end
  end
  
  # POST /v2.1/Tasks
  describe '#create_task' do
    xit 'creates and returns task' do
      expect(Insightly.client.create_task(task: {})).to be_a(Insightly::Resources::Task)
    end
  end

  # POST /v2.1/Tasks/{c_id}/Comments
  describe '#update_task' do
    xit 'updates and returns task' do
      expect(Insightly.client.update_task(task: {})).to be_a(Insightly::Resources::Task)
    end
  end
end