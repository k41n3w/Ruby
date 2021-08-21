# Require Pry
require "pry"

def hi(needed, needed2,
  maybe1 = "42", maybe2 = maybe1.upcase,
  *args,
  named1: 'hello', named2: a_method(named1, needed2),
  **options,
  &block)
end

p method(:hi).parameters

# Com asterisco na passagem de parametros
# divide os parametros por virgula
 
def print_metodo(*values)
  p values.each { |key, value| p "#{key}, #{value}" }
end

values = {3 => 4, 5 => 6}
print_metodo(*values) # print_metodo(param_1, param_2, param_3)

class User
  attr_accessor :name

  def initialize name
    @name = name
  end

  def hello(parametro = @name)
    return puts "Hello, #{parametro}!" if parametro
    "Hello, #{name}!"
  end
end

user = User.new("Caio")
user2 = User.new("Leitor")

# user.hello # Por algum motivo é o mesmo que user . hello
# user2.hello

# user.hello("Anonimous")
# user2.hello("Pirateira")



# user.send(:hello) # M3smo que chamar user.send("hello")
# user.public_send(:hello)

# user2.send(:hello)
# user2.public_send(:hello)

# user.send(:hello, "Send")
# user.public_send(:hello, "Send")

# user2.send(:hello, "Send2")
# user2.public_send(:hello, "Send2")



user.method(:hello).call
user.method(:hello).()
user.method(:hello)[]

user2.method(:hello).call 'Call'
user2.method(:hello).('Call')
user2.method(:hello)['Call']

# method = user.method(:hello)
# user.instance_variable_set(:@name, 'UHU') 
# method.call# prints "Hello, Not Only Code!"
binding.pry