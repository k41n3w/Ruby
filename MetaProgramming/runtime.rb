p 'Diferentes formas de adicionar comportamento a Classe e instancia'
# Classe
def String.novo_metodo
  p '-- Adicionando a Classe'
end

# Instancia
texto = 'Texto qualquer'

def texto.novo_metodo
  p '-- Adicionando a instancia'
end

String.novo_metodo

texto.novo_metodo
p '----------------------------------------------------------------------'
p 'Diferentes contextos do Self'
p "Self Main: #{self}"
class Carro
  p "Self Class: #{self}"

  def instance(modelo = 'Modelo qualquer')
    @modelo = modelo
  end

  def mostrar(modelo = 'Modelo Padrão')
    p "Self Method: #{self}"

    p "Modelo: #{modelo}"
  end

end
p "Self Main: #{self}"

p '----------------------------------------------------------------------'
p 'Adicionando os metodos em tempo de execucao e sobrescrevendo a classe Carro'
carro_comun = Carro.new
carro_comun.mostrar

hb20 = Carro.new
hb20ss = Carro.new

def hb20.mostrar
  p 'hb20'
end

def hb20ss.mostrar
  p 'hb20ss'
end

hb20.mostrar
hb20ss.mostrar
