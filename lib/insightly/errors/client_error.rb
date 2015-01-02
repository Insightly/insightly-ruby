module Insightly
  module Errors
    class ClientError < StandardError
      attr_reader :response
      def initialize(response:)
        @response = response
      end
    end
  end
end