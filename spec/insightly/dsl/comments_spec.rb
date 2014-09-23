require 'spec_helper'

describe Insightly::DSL::Comments do
  # GET /v2.1/Comments/{id}
  describe '#get_comment' do
    it 'returns a comment' do
      expect(Insightly.client.get_comment(id: 1)).to be_a(Insightly::Resources::Comment)
    end
  end

  # POST /v2.1/Comments?c_id={c_id}&filename={filename}
  describe '#add_comment_attachment' do
    xit 'returns a resonse with code 201' do
      response = Insightly.client.add_comment_attachment(id: 1, filename: '')
      # TODO: actually expect 201 response.
      # TODO: make stub file name deal with query params when generating filenames.
      expect(response.code).to eq(200)
    end
  end

  # PUT /v2.1/Comments
  describe '#update_comment' do
    it 'updates a comment' do
      # TODO: Better test.
      response = Insightly.client.update_comment(comment: {})
      expect(response).to be_a(Insightly::Resources::Comment)
    end
  end

  # DELETE /v2.1/Comments/{id}
  describe '#delete_comment' do
    it 'returns a response with code 202' do
      response = Insightly.client.delete_comment(id: 1)
      expect(response.code).to eq(202)
    end
  end
end