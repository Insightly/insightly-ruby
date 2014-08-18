require 'delegate'
require 'json'
require 'time'

module Insightly
  module Resources
    class Object < SimpleDelegator
      require 'insightly/resources/object/serializers'
      require 'insightly/resources/object/attributes'

      extend Serializers
      include Attributes

      # Define common attributes, applicable to different resources
      attribute :date_created_utc, Time
      attribute :date_updated_utc, Time

      def inspect
        "#<#{self.class.name}:#{object_id} #{attributes.map { |key, value| "@#{key}=#{value.inspect}" }.join(' ')}>"
      end
    end
  end
end
