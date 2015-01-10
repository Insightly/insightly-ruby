require 'spec_helper'

describe Insightly2::DSL::FileAttachments do
  let(:file_attachment_id) { 33105536 }

  # GET /v2.1/FileAttachments/{id}
  describe '#get_file_attachment' do
    it 'returns a response with code 200' do
      VCR.use_cassette('get_file_attachment') do
        response = Insightly2.client.get_file_attachment(id: file_attachment_id)
        expect(response.status).to eq(200)
      end
    end
  end
end