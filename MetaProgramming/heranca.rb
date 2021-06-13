# Herança por comportamento em tempo de execução
# Clone - Clona Metodos e Estado (Atributos)
# DUP - Duplica Estado (Atributos), mas não os Metodos


texto = "Instancia de String"

def texto.metodo_um
  p "Texto do método 1"
end

texto_um = texto.clone
texto_dois = texto.dup

p texto_um
p texto_um.metodo_um
p '---------------------------'
p texto_dois
# p texto_dois.metodo_um

def texto_dois.metodo_um
  p "Implementado após DUP"
end

texto_dois.metodo_um
