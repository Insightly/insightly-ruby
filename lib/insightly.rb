require 'insightly/version'

module Insightly
  autoload :Client, 'insightly/client'
  autoload :DSL, 'insightly/dsl'
  autoload :Resources, 'insightly/resources'
  autoload :Errors, 'insightly/errors'

  class << self
    # @return [String]
    attr_accessor :api_key
  end

  module_function

  # @return [Insightly::Client]
  def client
    @client ||= Client.new(Insightly.api_key)
  end
end
