require 'insightly/dsl'

module Insightly
  module DSL::FileAttachments
    # GET /v2.1/FileAttachments/{id}
    # @param [String, Fixnum] id A file attachment's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::FileAttachment, nil].
    def get_file_attachment(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::FileAttachment.parse(request(:get, "FileAttachments/#{id}"))
    end
  end
end
