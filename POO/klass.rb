require_relative 'interface'
require_relative 'abstrata'

class Klass < Abstrata # Serviu como classe base para testar outras
  def initialize
    p 'initialize Klass'
  end

  # def metodo_um
  #   p "Implementado!"
  # end

  # def metodo_dois
  #   p "Implementado!"
  # end
end

Klass.new.metodo_um
Klass.new.metodo_dois
