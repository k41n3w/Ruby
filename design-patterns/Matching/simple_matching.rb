# Só funciona em Elixir, bla
# [a, b, c] = [:hello, "world", 42]
#
# p a
# p b
# p c

translation = ['th', 'เต้', 'ja', 'テイ']

case translation
in ['th', orig_text, 'en', trans_text]
  puts "English translation: #{orig_text} => #{trans_text}"
in ['th', orig_text, 'ja', trans_text]
  # this will get executed
  puts "Japanese translation: #{orig_text} => #{trans_text}"
end


p '------------------------------------------------------------------------------'
# Exemplo:

from = 'caconde'
to   = 'são paulo'

# Não sei a distancia
# from = 'caconde'
# to   = ''

case [from, to]
in 'caconde', 'são paulo'
  puts 'Longa viagem!'
in 'são josé', 'são paulo'
  puts 'Pertinho!'
in 'caconde', _
  puts 'Não sei a distância :/'
else
  puts 'Caminho não encontrado'
end
