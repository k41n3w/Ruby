class Abstrata
  def interface
    raise "Classe não pode ser instânciada, somente herdada!"
  end

  def metodo_um
    p "Método um!"
  end

  def metodo_dois
    raise "Implemente a método dois!"
  end
end
