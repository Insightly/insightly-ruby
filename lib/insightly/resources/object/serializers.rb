module Insightly
  module Resources
    class Object
      module Serializers
        module Object
          def self.serialize(value)
            value.to_s
          end

          def self.deserialize(value)
            value
          end
        end

        module Time
          def self.serialize(value)
            value.utc.xmlschema
          end

          def self.deserialize(value)
            ::Time.parse(value)
          end
        end

        module ClassMethods
          # @return [Hash] corresponding serializers for different attributes
          def serializers
            @serializers ||= {}
          end

          # @param [String, Symbol] type type of attribute to be serialized or deserialized
          # @return [#serialize, #deserialize] serializer for provided type
          def serializer_for(type)
            serializers[type] ||=
              begin
                class_symbol = type.to_s.to_sym
                if type.respond_to?(:deserialize) && type.respond_to?(:serialize)
                  type
                elsif Serializers.constants.include?(class_symbol)
                  Serializers.const_get(class_symbol)
                elsif Resources.constants.include?(class_symbol)
                  Resources.const_get(class_symbol)
                else
                  Serializers::Object
                end
              end
          end

          # @param [Net::HTTPResponse] response
          # @return [<Object>, Object]
          def deserialize(response)
            raise "Response #{response.class.name} to be a Faraday::Response" unless response.is_a?(Faraday::Response)

            attributes = response.body.to_s
            begin
              attributes = JSON.parse(response.body)
            rescue JSON::ParserError
              puts "Could not parse: #{response.body}"
            end

            # TODO: Deal with nested attributes (not being downcased).
            case attributes
            when Array
              attributes.map { |object| new(object) }
            when Hash
              new(attributes)
            end
          end

          alias_method :parse, :deserialize

          def serialize(object)
            object.serialize
          end
        end

        def self.included(base)
          super
          base.extend ClassMethods
        end

        def serialize
          {}.tap do |result|
            attributes.each do |name, value|
              result[name.upcase] = self.class.serializer_for(name).serialize(value)
            end
          end
        end
      end
    end
  end
end
