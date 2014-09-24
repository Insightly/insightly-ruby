require 'spec_helper'

describe Insightly::DSL::FileCategories do
  # DELETE /v2.1/FileCategories/{id}
  describe '#delete_file_category' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_file_category(id: 1)
      expect(response.code).to eq(202)
    end
  end

  # GET /v2.1/FileCategories
  describe '#get_file_categories' do
    it 'returns an array of file_categories' do
      file_categories = Insightly.client.get_file_categories
      expect(file_categories).to be_a(Array)
      expect(file_categories.first).to be_a(Insightly::Resources::FileCategory)
    end
  end

  # GET /v2.1/FileCategories/{id}
  describe '#get_file_categories' do
    it 'returns a file category' do
      expect(Insightly.client.get_file_category(id: 1)).to be_a(Insightly::Resources::FileCategory)
    end
  end

  # POST /v2.1/FileCategories
  describe '#create_file_category' do
    it 'creates and returns a file category' do
      expect(Insightly.client.create_file_category(category: {})).to be_a(Insightly::Resources::FileCategory)
    end
  end

  # PUT /v2.1/FileCategories
  describe '#update_file_category' do
    it 'updates and returns a file category' do
      expect(Insightly.client.update_file_category(category: {id: 1})).to be_a(Insightly::Resources::FileCategory)
    end
  end
end