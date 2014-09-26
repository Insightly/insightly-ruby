require 'insightly/dsl'

module Insightly
  module DSL::Users
    # GET /v2.1/Users/{id}
    # Get a user.
    # @param [String, Fixnum] id A user's ID.
    # @return [Insightly::Resources::User, nil].
    def get_user(id:)
      Resources::User.parse(request(:get, "Users/#{id}"))
    end

    # GET /v2.1/Users
    # Get a list of users.
    # @return [Array, nil]
    def get_users
      Resources::User.parse(request(:get, "Users"))
    end
  end
end
