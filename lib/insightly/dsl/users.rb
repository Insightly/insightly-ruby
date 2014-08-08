require 'insightly/dsl'

module Insightly
  module DSL::Users
    # @return [<Insightly::Resources::User>, nil]
    def get_users
      Resources::User.parse(request(:get, 'Users'))
    end

    # @return [Insightly::Resources::User]
    # @param [String, Fixnum] id A User's ID
    def get_user(id)
      Resources::User.parse(request(:get, "Users/#{id}"))
    end
  end
end
