require 'spec_helper'

describe Insightly::DSL::FileCategories do
  # DELETE /v2.1/FileCategories/{id}
  describe '#delete_file_category' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_file_category(1)
      expect(response.code).to eq('202')
    end
  end

  # GET /v2.1/FileCategories

  # GET /v2.1/FileCategories/{id}
  describe '#get_file_categories' do
    it 'returns a file category' do
      expect(Insightly.client.get_file_category(1)).to be_a(Insightly::Resources::FileCategory)
    end
  end

  # POST /v2.1/FileCategories

  # PUT /v2.1/FileCategories
end