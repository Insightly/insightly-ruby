require 'spec_helper'

describe Insightly::DSL::TaskCategories do
  # GET /v2.1/TaskCategories/{id}
  describe '#get_task_category' do
    it 'returns a task category' do
      expect(Insightly.client.get_task_category(id: 1)).to be_a(TaskCategory)
    end
  end

  # GET /v2.1/TaskCategories
  describe '#get_task_categories' do
    it 'returns an array of task_categories' do
      task_categories = Insightly.client.get_task_categories
      expect(task_categories).to be_a(Array)
      expect(task_categories.first).to be_a(TaskCategory)
    end
  end

  # POST /v2.1/TaskCategories
  describe '#create_task_category' do
    it 'creates and returns task_category' do
      expect(Insightly.client.create_task_category(category: {category_name: ''})).to be_a(TaskCategory)
    end
  end

  # PUT /v2.1/TaskCategories
  describe '#update_task_category' do
    it 'updates and returns task_category' do
      expect(Insightly.client.update_task_category(category: {category_name: ''})).to be_a(TaskCategory)
    end
  end

  # DELETE /v2.1/TaskCategories/{id}
  describe '#delete_task_category' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_task_category(id: 1)
      expect(response.status).to eq(202)
    end
  end
end