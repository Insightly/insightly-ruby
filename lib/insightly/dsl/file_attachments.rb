require 'insightly/dsl'

module Insightly
  module DSL::FileAttachments
    # GET /v2.1/FileAttachments/{id}
    # @return [Insightly::Resources::FileAttachment]
    # @param [String, Fixnum] id: A FileAttachment's ID
    def get_file_attachment(id:)
      Resources::FileAttachment.parse(request(:get, "FileAttachments/#{id}"))
    end
  end
end
