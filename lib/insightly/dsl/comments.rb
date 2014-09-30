require 'insightly/dsl'

module Insightly
  module DSL::Comments
    # GET /v2.1/Comments/{id}
    # Get a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Comment, nil].
    def get_comment(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      Resources::Comment.parse(request(:get, "Comments/#{id}"))
    end

    # POST /v2.1/Comments?c_id={c_id}&filename={filename}
    # Adds a file attachment to a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @param [String] filename The name of the attachment.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def create_comment_attachment(id:, filename:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      raise ArgumentError, "Filename cannot be nil" if filename.nil?
      request(:post, "Comments/?c_id=#{id}&filename=#{filename}")
    end

    # PUT /v2.1/Comments
    # Updates a comment.
    # @param [Hash] comment The comment to update.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [Insightly::Resources::Comment, nil].
    def update_comment(comment:)
      raise ArgumentError, "Comment cannot be nil" if comment.nil?
      Resources::Comment.parse(request(:put, "Comments", comment))
    end

    # DELETE /v2.1/Comments/{id}
    # Deletes a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @raise [ArgumentError] If the method arguments are nil.
    # @return [RestClient::Response].
    def delete_comment(id:)
      raise ArgumentError, "ID cannot be nil" if id.nil?
      request(:delete, "Comments/#{id}")
    end
  end
end
