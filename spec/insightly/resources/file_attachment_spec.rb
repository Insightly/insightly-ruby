require 'spec_helper'

describe Insightly::Resources::FileAttachment do
  # TODO - I don't believe it's possible to get a file attachment
  # in a parseable format directly from the file attachment end point.
  # You have to extract it from another resources array of file attachment
  # hashes. The deserializer can currently only accept a response object
  # so it's not possible to pass a hash and get back a resource object
  # which is what we want to do in this test.

  # subject(:file_attachment) do
    # VCR.use_cassette('get_email_comments') do
    #   comments = Insightly.client.get_email_comments(id: 17683283)
    #   comment = comments.last
    #   file_attachment = comment['FILE_ATTACHMENTS'].last
    #   FileAttachment.parse(file_attachment)
    # end
  # end

  # describe 'instance' do
  #   it 'is decorated with FileAttachment object' do
  #     expect(subject).to be_a(described_class)
  #   end
  #
  #   %w(file_attachment_id).each do |method|
  #     it "responds to #{method}" do
  #       expect(subject).to respond_to(method)
  #     end
  #   end
  # end
end