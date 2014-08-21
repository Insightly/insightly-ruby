require 'spec_helper'

describe Insightly::Resources::FileAttachment do
  subject(:file_attachment) { Insightly.client.get_file_attachment(1) }

  describe 'instance' do
    it 'is decorated with FileAttachment object' do
      expect(subject).to be_a(described_class)
    end

    %w(file_attachment_id).each do |method|
      it "responds to #{method}" do
        expect(subject).to respond_to(method)
      end
    end
  end
end