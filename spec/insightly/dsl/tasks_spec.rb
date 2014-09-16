require 'spec_helper'

describe Insightly::DSL::Tasks do
  # DELETE /v2.1/Tasks/{id}
  describe '#delete_task' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_task(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/Tasks/{c_id}/Comments

  # GET /v2.1/Tasks/{id}
  describe '#get_task' do
    it 'returns a task' do
      expect(Insightly.client.get_task(1)).to be_a(Task)
    end
  end

  # GET /v2.1/Tasks?ids={ids}
  describe '#get_tasks' do
    it 'returns an array of task_categories' do
      tasks = Insightly.client.get_tasks
      expect(tasks).to be_a(Array)
      expect(tasks.first).to be_a(Task)
    end
  end
  
  # POST /v2.1/Tasks

  # POST /v2.1/Tasks/{c_id}/Comments

  # PUT /v2.1/Tasks
end