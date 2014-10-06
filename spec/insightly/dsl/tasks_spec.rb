require 'spec_helper'

describe Insightly::DSL::Tasks do
  let(:task_id) { 14694323 }

  # GET /v2.1/Tasks/{id}
  describe '#get_task' do
    it 'returns a task' do
      VCR.use_cassette('get_task') do
        expect(Insightly.client.get_task(id: task_id)).to be_a(Task)
      end
    end
  end

  # GET /v2.1/Tasks?ids={ids}
  describe '#get_tasks' do
    it 'returns an array of tasks' do
      VCR.use_cassette('get_tasks') do
        tasks = Insightly.client.get_tasks
        expect(tasks).to be_a(Array)
        expect(tasks.first).to be_a(Task)
      end
    end
  end

  # GET /v2.1/Tasks/{id}/Comments
  describe '#get_comment_tasks' do
    it 'returns an array of task comments' do
      VCR.use_cassette('get_task_comments') do
        comments = Insightly.client.get_task_comments(id: task_id)
        expect(comments).to be_a(Array)
        expect(comments.first).to be_a(Comment)
      end
    end
  end

  # POST /v2.1/Tasks
  describe '#create_task' do
    it 'creates and returns task' do
      VCR.use_cassette('create_task') do
        task = Insightly.client.get_task(id: task_id)
        expect(Insightly.client.create_task(task: task)).to be_a(Task)
      end
    end
  end

  # POST /v2.1/Tasks/{c_id}/Comments
  describe '#create_task_comment' do
    it 'creates and returns comment' do
      VCR.use_cassette('create_task_comment') do
        expect(Insightly.client.create_task_comment(id: task_id, comment: {title: 'Sharknado'})).to be_a(Comment)
      end
    end
  end

  # PUT /v2.1/Tasks
  describe '#update_task' do
    it 'updates and returns task' do
      VCR.use_cassette('update_task') do
        task = Insightly.client.get_task(id: task_id)
        expect(Insightly.client.update_task(task: task)).to be_a(Task)
      end
    end
  end

  # DELETE /v2.1/Tasks/{id}
  describe '#delete_task' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_task') do
        response = Insightly.client.delete_task(id: task_id)
        expect(response.status).to eq(202)
      end
    end
  end
end