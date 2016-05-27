require 'insightly2/version'

module Insightly2
  autoload :Client, 'insightly2/client'
  autoload :DSL, 'insightly2/dsl'
  autoload :Resources, 'insightly2/resources'
  autoload :Errors, 'insightly2/errors'
  autoload :Utils, 'insightly2/utils'

  class << self
    # @return [String]
    attr_accessor :api_key
    attr_accessor :logger
  end

  module_function

  # @return [Insightly2::Client]
  def client
    if @client && @client.api_key != self.api_key
      @client = Client.new(Insightly2.api_key) #force new client in case api_key has changed
    else
      @client ||= Client.new(Insightly2.api_key)
    end
  end
end
