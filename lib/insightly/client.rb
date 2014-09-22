require 'string'
require 'rest_client'
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
    # @param [Hash] query
    # @return [Net::HTTPResponse] server response
    # def request(method, path, query = {})
    #   raise ArgumentError.new("Wrong method #{method.inspect}. :get, :post, :put, :delete are allowed") unless REQUESTS.keys.include?(method)

    #   query = if query.empty?
    #             '?' << query.inject([]) do |result, (name, value)|
    #               result << "#{name}=#{value.is_a?(Array) ? value.join(',') : value}"
    #             end.join('&')
    #           else
    #             nil
    #           end
    #   uri = URI.parse("#{URL}#{path}#{query}")

    #   http = Net::HTTP.new(uri.host, uri.port)
    #   http.use_ssl = true

    #   request = REQUESTS[method.to_sym].new(uri.path)
    #   request.basic_auth(@api_key, '')

    #   http.request(request)
    # end

    def request(method, path, query = {})
      response = RestClient::Request.new(
        method: method,
        url: URL + path.to_s,
        params: query,
        user: @api_key,
        password: '',
        headers: {accept: :json, content_type: :json}
      ).execute
      JSON.parse(response.to_s)
    end
  end
end

require 'insightly/dsl'

module Insightly
  class Client
    include DSL
  end
end
