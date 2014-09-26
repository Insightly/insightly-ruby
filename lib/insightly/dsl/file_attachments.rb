require 'insightly/dsl'

module Insightly
  module DSL::FileAttachments
    # GET /v2.1/FileAttachments/{id}
    # @param [String, Fixnum] id A file attachment's ID.
    # @return [Insightly::Resources::FileAttachment, nil].
    def get_file_attachment(id:)
      Resources::FileAttachment.parse(request(:get, "FileAttachments/#{id}"))
    end
  end
end
