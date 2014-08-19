require 'insightly/dsl'

module Insightly
  module DSL::Comments
    # DELETE /v2.1/Comments/{id}
    # @param [String, Fixnum] id A Comment's ID
    def delete_comment(id)
      request(:delete, "Comments/#{id}")
    end

    # GET /v2.1/Comments/{id}
    # @return [Insightly::Resources::Comment]
    # @param [String, Fixnum] id A Comment's ID
    def get_comment(id)
      Resources::Comment.parse(request(:get, "Comments/#{id}"))
    end

    # POST /v2.1/Comments?c_id={c_id}&filename={filename}

    # PUT /v2.1/Comments
  end
end
