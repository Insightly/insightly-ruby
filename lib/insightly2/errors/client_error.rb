module Insightly2
  module Errors
    class ClientError < StandardError
      attr_reader :response
      def initialize(response: nil)
        @response = response
      end
    end
  end
end