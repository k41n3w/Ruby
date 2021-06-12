require 'singleton'

class InstanciaUnica
  # Faz todo código para criar instancia unica
  #  Cria método de instancia, deixa construtor privado
  include Singleton

  def metodo_um
    p 'Método um'
  end

  def metodo_dois
    p 'Método dois'
  end

end

# InstanciaUnica.new

InstanciaUnica.instance.metodo_um
InstanciaUnica.instance.metodo_dois

p InstanciaUnica.instance === InstanciaUnica.instance