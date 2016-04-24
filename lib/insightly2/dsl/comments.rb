require 'insightly2/dsl'

module Insightly2
  module DSL::Comments
    # GET /v2.1/Comments/{id}
    # Get a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Comment, nil].
    def get_comment(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      Resources::Comment.parse(request(:get, "Comments/#{id}"))
    end

    # POST /v2.1/Comments?c_id={c_id}&filename={filename}
    # Adds a file attachment to a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @param [String] filename The name of the attachment.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def create_comment_attachment(id: nil, filename: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      raise ArgumentError, 'Filename cannot be blank' if filename.blank?
      request(:post, "Comments/?c_id=#{id}&filename=#{filename}")
    end

    # PUT /v2.1/Comments
    # Updates a comment.
    # @param [Hash] comment The comment to update.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::Comment, nil].
    def update_comment(comment: nil)
      raise ArgumentError, 'Comment cannot be blank' if comment.blank?
      Resources::Comment.parse(request(:put, 'Comments', comment))
    end

    # DELETE /v2.1/Comments/{id}
    # Deletes a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Faraday::Response].
    def delete_comment(id: nil)
      raise ArgumentError, 'ID cannot be blank' if id.blank?
      request(:delete, "Comments/#{id}")
    end
  end
end
