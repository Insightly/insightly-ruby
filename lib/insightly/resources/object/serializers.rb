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
            value.xmlschema
          end

          def self.deserialize(value)
            ::Time.parse(value)
          end
        end

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
              if type.respond_to?(:deserialize)
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
          return nil unless response.is_a?(String) || response.is_a?(Array) || response.is_a?(Net::HTTPOK)
          if response.respond_to?(:body)
            response = response.body
            json = JSON.parse(response)
          else
            json = response
          end
          case json
          when Array
            json.map { |object| new(object) }
          when Hash
            new(json)
          end
        end

        alias_method :parse, :deserialize
      end
    end
  end
end
