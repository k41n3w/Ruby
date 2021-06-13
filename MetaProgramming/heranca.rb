require '../Utilidades/cpf_cnpj_validators.rb'

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


p '--------------------------------------------'
p 'Extends << --- Adicionando novos metodos a instancia em tempo de execução através de um modulo'

novo_texto = 'Um novo texto qualquer'

class << novo_texto
  def metodo_novo_um
    p 'Metodo novo um'
  end

  def metodo_novo_dois
    p 'Metodo novo dois'
  end
end

p novo_texto
novo_texto.metodo_novo_um
novo_texto.metodo_novo_dois
# novo_texto.metodo_novo_tres


p '--------------------------------------------'
p 'Inclusão de metodos para classe, utilizando self'
p 'Evita ter que ficar digitando def _klass_.texto_x'

class Klass
  class << self
    def texto_um
      p 'texto um'
    end

    def texto_dois
      p 'texto dois'
    end
  end
end

Klass.texto_um
Klass.texto_dois

p '--------------------------------------------'
p 'Adicionando attr_accesors a classe'

class Accessors
  class << self
    attr_accessor :texto
  end
end
p Accessors.texto
Accessors.texto = 'Texto adicionado ao Acessors'
p Accessors.texto

p '--------------------------------------------'
p 'Modulo - Namespaces'

module Utilidades
  class Cpf
    attr_accessor :document

    def validar
      check_cpf(document)
    end
  end

  class Cnpj
    attr_accessor :document

    def validar
      check_cnpj(document)
    end
  end
end

ut_cpf = Utilidades::Cpf.new
p ut_cpf
ut_cpf.document = '38250860896'
p ut_cpf.validar

ut_cnpj = Utilidades::Cnpj.new
p ut_cnpj
ut_cnpj.document = '38250860896'
p ut_cnpj.validar

class CadastroPessoa
  include Utilidades

end

