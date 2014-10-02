require 'faraday'
require 'json'
require 'openssl'
require 'active_support/all'
require 'insightly/utils/url_helper'

module Insightly
  class Client
    URL = 'https://api.insight.ly/v2.1/'

    REQUESTS = [:get, :post, :put, :delete]
    HEADERS = {'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    # @param [String] api_key
    def initialize(api_key = Insightly.api_key)
      @api_key = api_key

      # Setup HTTP request conntection to insightly.
      @connection ||= Faraday.new do |builder|
        builder.basic_auth @api_key, ''
        builder.request :url_encoded
        builder.response :logger
        builder.adapter Faraday.default_adapter
      end
    end

    # @param [:get, :post, :put, :delete] method.
    # @param [String] path.
    # @param [Hash] query (optional).
    # @param [Hash] headers request headers (optional).
    # @return [Faraday::Response] server response.
    def request(method, path, query = {}, headers = HEADERS)
      raise ArgumentError.new("Wrong method #{method.inspect}. :get, :post, :put, :delete are allowed") unless REQUESTS.include?(method)

      payload = !query.empty? ? JSON.generate(query) : ''
      @connection.run_request(method, "#{URL}#{path}", payload, headers)
    end
  end
end

require 'insightly/dsl'

module Insightly
  class Client
    include DSL
  end
end
