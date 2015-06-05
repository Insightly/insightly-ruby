require 'insightly2/dsl'

module Insightly2
  module DSL::Users
    # GET /v2.1/Users/{id}
    # Get a user.
    # @param [String, Fixnum] id A user's ID.
    # @raise [ArgumentError] If the method arguments are blank.
    # @return [Insightly2::Resources::User, nil].
    def get_user(id: nil)
      raise ArgumentError, "ID cannot be blank" if id.blank?
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
