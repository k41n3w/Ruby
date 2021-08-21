require 'forwardable'
require 'singleton'

# Classe para demonstrar uso do fowardable para evitar uso do instance.
class MyClass
  include Singleton
  class << self
    extend Forwardable
    def_delegators :instance, :method_one
    def_delegators :instance, :mehod_two
  end

  def method_one
    p 'method_one'
  end

  def mehod_two
    p 'mehod_two'
  end
end

# MyClass.new
# Traceback (most recent call last):
#   fowardable_singleton.rb:23:in `<main>': private method `new' called for MyClass:Class (NoMethodError)

MyClass.instance.method_one
MyClass.instance.mehod_two

# Chamando sem instance
MyClass.method_one
MyClass.mehod_two
