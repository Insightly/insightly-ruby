require 'spec_helper'

describe Insightly::DSL::FileCategories do
  let(:file_category_id) { 1947439 }

  # GET /v2.1/FileCategories/{id}
  describe '#get_file_category' do
    it 'returns a file category' do
      VCR.use_cassette('get_file_category') do
        expect(Insightly.client.get_file_category(id: file_category_id)).to be_a(FileCategory)
      end
    end
  end

  # GET /v2.1/FileCategories
  describe '#get_file_categories' do
    it 'returns an array of file_categories' do
      VCR.use_cassette('get_file_categories') do
        file_categories = Insightly.client.get_file_categories
        expect(file_categories).to be_a(Array)
        expect(file_categories.first).to be_a(FileCategory)
      end
    end
  end

  # POST /v2.1/FileCategories
  describe '#create_file_category' do
    it 'creates and returns a file category' do
      VCR.use_cassette('create_file_category') do
        file_category = Insightly.client.get_file_category(id: file_category_id)
        expect(Insightly.client.create_file_category(category: file_category)).to be_a(FileCategory)
      end
    end
  end

  # PUT /v2.1/FileCategories
  describe '#update_file_category' do
    it 'updates and returns a file category' do
      VCR.use_cassette('update_file_category') do
        file_category = Insightly.client.get_file_category(id: file_category_id)
        expect(Insightly.client.update_file_category(category: file_category)).to be_a(FileCategory)
      end
    end
  end

  # DELETE /v2.1/FileCategories/{id}
  describe '#delete_file_category' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_file_category') do
        response = Insightly.client.delete_file_category(id: file_category_id)
        expect(response.status).to eq(202)
      end
    end
  end
end