require 'delegate'

module Insightly
  class Object < SimpleDelegator
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
          Time.parse(value)
        end
      end
    end

    def self.serializers
      @serializers ||= {}
    end

    def self.serializer_for(type)
      serializers[type] ||= if Serializers.constants.include?(type.to_s.to_sym)
                              Serializers.const_get(type.to_sym)
                            else
                              Serializers::Object
                            end
    end

    def self.attributes
      @attributes ||= {}
    end

    def self.attributes_module
      @attributes_module ||= const_set(:Attributes, Module.new)
    end

    def self.attribute(name, type = String)
      attributes[name] = type

      define_attribute_accessor(name, type)
    end

    def self.define_attribute_accessor(name, type = Object)
      attributes_module.define_method(name) do
        deserialize_attribute(name, type)
      end
    end

    # @param [Net::HTTPResponse] response
    # @return [<Object>, Object]
    def self.parse(response)
      return nil unless response.is_a?(Net::HTTPOK)
      json = JSON.parse(response.body)
      case json
      when Array
        json.map { |object| new(object) }
      when Hash
        new(json)
      end
    end

    def method_missing(name, *args, &block)
      attribute = name.to_s.upcase
      if __getobj__.key?(attribute)
        self.class.define_attribute_accessor(name)
        public_send(name, *args, &block)
      else
        super
      end
    end

    private

    def respond_to_missing?(name, include_all = false)
      __getobj__.key?(name.to_s.upcase) || super(name, include_all)
    end

    # @param [String, Symbol] name
    # @param [Class, #to_s] type
    def deserialize_attribute(name, type)
      raw = __getobj__[name.to_s.upcase]
      self.class.serializer_for(type.to_s).deserialize(raw)
    end
  end
end