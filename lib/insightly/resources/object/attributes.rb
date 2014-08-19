module Insightly::Resources::Object::Attributes
  module ClassMethods
    def attributes
      @attributes ||=
        begin
          if superclass.respond_to?(:attributes)
            superclass.attributes.dup
          else
            Hash.new { |hash, key| hash[key] = ::Object }
          end
        end
    end

    # @return [Module] module holding all attribute accessors
    def attributes_module
      @attributes_module ||= const_set(:AttributeMethods, Module.new)
    end

    def define_attribute_accessor(name, type = nil)
      type ||= attributes[name.to_sym] || Object
      attributes_module.send(:define_method, name) do
        deserialize_attribute(name, type)
      end
    end

    def attribute(name, type = String)
      attributes[name] = type

      define_attribute_accessor(name, type)
    end

    alias_method :has_many, :attribute
  end

  def self.included(base)
    base.extend(ClassMethods)
    super
  end

  def attributes
    {}.tap do |result|
      __getobj__.keys.each do |key|
        attribute = key.to_s.downcase
        result[attribute] = public_send(attribute)
      end
    end
  end

  def method_missing(name, *args, &block)
    attribute = name.to_s.upcase
    if __getobj__.key?(attribute)
      self.class.define_attribute_accessor(name)
      deserialize_attribute(name, self.class.attributes[name.to_sym])
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
    self.class.serializer_for(type).deserialize(raw)
  end
end
