class Object
  def singleton_class
    class << self
      self
    end
  end
end

class Object
  class << self
    def define_singleton_method(name, &block)
      define_method name, &block
    end
  end
end

class String
  def to_proc
    proc do |arg|
      operations = split '.'
      operations.each do |op|
        arg = arg.public_send(op.to_sym)
      end
      arg
    end
  end
end

class Proxy
  def initialize(args)
    @proxy = args
  end

  def method_missing(method)
    @proxy.send(method)
  end
end

class Module
  def private_attr_accessor(name)
    class_eval <<-RUBY
    private
    def #{name}
      @#{name}
    end
    RUBY
  end
end
