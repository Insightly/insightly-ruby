require 'insightly/version'

module Insightly
  autoload :Client, 'insightly/client'
  autoload :Resources, 'insightly/resources'

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
