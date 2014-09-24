require 'spec_helper'

describe Insightly::DSL::FileAttachments do
  # GET /v2.1/FileAttachments/{id}
  describe '#get_file_attachment' do
    it 'returns a file attachment' do
      expect(Insightly.client.get_file_attachment(id: 1)).to be_a(Insightly::Resources::FileAttachment)
    end
  end
end