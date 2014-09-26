require 'insightly/dsl'

module Insightly
  module DSL::Comments
    # GET /v2.1/Comments/{id}
    # Get a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @return [Insightly::Resources::Comment, nil].
    def get_comment(id:)
      Resources::Comment.parse(request(:get, "Comments/#{id}"))
    end

    # POST /v2.1/Comments?c_id={c_id}&filename={filename}
    # Adds a file attachment to a comment.
    # @param [String, Fixnum] id A comment's ID.
    # @param [String] filename The name of the attachment.
    # @return [RestClient::Response].
    def create_comment_attachment(id:, filename:)
      request(:post, "Comments/?c_id=#{id}&filename=#{filename}")
    end

    # PUT /v2.1/Comments
    # Updates a Comment.
    # @param [Hash] comment The comment to update.
    # @return [Insightly::Resources::Comment, nil].
    def update_comment(comment:)
      Resources::Comment.parse(request(:put, "Comments", comment))
    end

    # DELETE /v2.1/Comments/{id}
    # @param [String, Fixnum] id A comment's ID.
    # @return [RestClient::Response].
    def delete_comment(id:)
      request(:delete, "Comments/#{id}")
    end
  end
end
