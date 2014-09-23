require 'insightly/dsl'

module Insightly
  module DSL::Comments
    # GET /v2.1/Comments/{id}
    # @param [id:] id A Comment's ID
    # @return [Insightly::Resources::Comment]
    def get_comment(id:)
      Resources::Comment.parse(request(:get, "Comments/#{id}"))
    end

    # POST /v2.1/Comments?c_id={c_id}&filename={filename}
    # Adds a File Attachment to a Comment.  Don't know the context of this, but it is weird.
    # @param [id:] comment id.
    # @param [filename:] name of the attachment.
    # @return [201|400|404|403|417]
    def add_comment_attachment(id:, filename:)
      request(:post, "Comments/?c_id=#{id}&filename=#{filename}")
    end

    # PUT /v2.1/Comments
    # Updates a Comment.
    # @param [comment:] comment object (with id).
    # return [200|400|404|403]
    def update_comment(comment:)
      Resources::Comment.parse(request(:put, "Comments", comment))
    end

    # DELETE /v2.1/Comments/{id}
    # @param [id:] id A Comment's ID
    def destroy_comment(id:)
      request(:delete, "Comments/#{id}")
    end
  end
end
