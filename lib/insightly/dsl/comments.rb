require 'insightly/dsl'

module Insightly
  module DSL::Comments
    # @return [Insightly::Resources::Comment]
    # @param [String, Fixnum] id A Comment's ID
    def get_comment(id)
      Resources::Comment.parse(request(:get, "Comments/#{id}"))
    end
  end
end
