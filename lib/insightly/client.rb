require 'net/http'
require 'openssl'

module Insightly
  class Client
    URL = 'https://api.insight.ly/v2.1/'
    
    REQUESTS = {
      get: Net::HTTP::Get,
      post: Net::HTTP::Post,
      put: Net::HTTP::Put,
      delete: Net::HTTP::Delete,
    }

    # @param [String] api_key
    def initialize(api_key = Insightly.api_key)
      @api_key = api_key
    end

    # @param [:get, :post, :put, :delete] method
    # @param [String] path
    # @param [Net::HTTPResponse] server response
    def request(method, path)
      raise ArgumentError.new("Wrong method #{method.inspect}. :get, :post, :put, :delete are allowed") unless REQUESTS.keys.include?(method)

      uri = URI.parse("#{URL}#{path}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = REQUESTS[method.to_sym].new(uri.path)
      request.basic_auth(@api_key, '')

      http.request(request)
    end
  end
end
