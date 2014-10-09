module Insightly
  module Errors
    class ClientError < StandardError
      def initialize(response:)
        @response = response
      end
    end
  end
end