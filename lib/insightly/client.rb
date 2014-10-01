require 'rest_client'
require 'openssl'
require 'active_support/all'
require 'utils/string'

module Insightly
  class Client
    URL = 'https://api.insight.ly/v2.1/'

    REQUESTS = [:get, :post, :put, :delete]

    # @param [String] api_key
    def initialize(api_key = Insightly.api_key)
      @api_key = api_key
    end

    # @param [:get, :post, :put, :delete] method
    # @param [String] path
    # @param [Hash] query
    # @return [RequestClient::Response] server response
    def request(method, path, query = {})
      raise ArgumentError.new("Wrong method #{method.inspect}. :get, :post, :put, :delete are allowed") unless REQUESTS.include?(method)

      RestClient::Request.new(
        method: method,
        url: URL + path.to_s,
        payload: query,
        user: @api_key,
        password: '',
        headers: {accept: :json, content_type: :json}
      ).execute
    end
  end
end

require 'insightly/dsl'

module Insightly
  class Client
    include DSL
  end
end
