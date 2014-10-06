require 'spec_helper'

describe Insightly::DSL::TaskCategories do
  let(:task_category_id) { 1947437 }

  # GET /v2.1/TaskCategories/{id}
  describe '#get_task_category' do
    it 'returns a task category' do
      VCR.use_cassette('get_task_category') do
        expect(Insightly.client.get_task_category(id: task_category_id)).to be_a(TaskCategory)
      end
    end
  end

  # GET /v2.1/TaskCategories
  describe '#get_task_categories' do
    it 'returns an array of task_categories' do
      VCR.use_cassette('get_task_categories') do
        task_categories = Insightly.client.get_task_categories
        expect(task_categories).to be_a(Array)
        expect(task_categories.first).to be_a(TaskCategory)
      end
    end
  end

  # POST /v2.1/TaskCategories
  describe '#create_task_category' do
    it 'creates and returns task_category' do
      VCR.use_cassette('create_task_category') do
        task_category = Insightly.client.get_task_category(id: task_category_id)
        expect(Insightly.client.create_task_category(category: task_category)).to be_a(TaskCategory)
      end
    end
  end

  # PUT /v2.1/TaskCategories
  describe '#update_task_category' do
    it 'updates and returns task_category' do
      VCR.use_cassette('update_task_category') do
        task_category = Insightly.client.get_task_category(id: task_category_id)
        expect(Insightly.client.update_task_category(category: task_category)).to be_a(TaskCategory)
      end
    end
  end

  # DELETE /v2.1/TaskCategories/{id}
  describe '#delete_task_category' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_task_category') do
        response = Insightly.client.delete_task_category(id: task_category_id)
        expect(response.status).to eq(202)
      end
    end
  end
end