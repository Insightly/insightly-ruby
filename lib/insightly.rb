require 'insightly/version'

module Insightly
  autoload :Client, 'insightly/client'
  autoload :DSL, 'insightly/dsl'
  autoload :Resources, 'insightly/resources'

  class << self
    # @return [String]
    attr_accessor :api_key
    # @return [Logger]
    attr_accessor :logger
    def logger
      @logger || Logger.new(STDOUT)
    end
  end

  module_function

  # @return [Insightly::Client]
  def client
    @client ||= Client.new(Insightly.api_key)
  end
end
