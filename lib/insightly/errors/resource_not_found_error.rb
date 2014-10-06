module Insightly
  module Errors
    class ResourceNotFoundError < StandardError
      def initialize(response:)
        @response = response
      end
    end
  end
end