require 'insightly2/dsl'

module Insightly2
  module DSL::FileAttachments
    # GET /v2.1/FileAttachments/{id}
    # @param [String, Fixnum] id A file attachment's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def get_file_attachment(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
      request(:get, "FileAttachments/#{id}")
    end
  end
end
