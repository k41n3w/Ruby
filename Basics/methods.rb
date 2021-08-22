p '# Seta padroes pré definidos para casos nulos, good'

def test(a1 = "Ruby", a2 = "Perl")
  puts "The programming language is #{a1}"
  puts "The programming language is #{a2}"
end
test "C", "C++"
test

p '# Retornando multiplos retornos, too good'
def test_two
  i = 100
  j = 200
  k = 300
  return i, j, k
end
puts test_two

p '# quantidade de parametros não definidas, amazing'
def sample (*test)
  puts "The number of parameters is #{test.length}"
  for i in 0...test.length
     puts "The parameters are #{test[i]}"
  end
end
sample "Zara", "6", "F"
sample "Mac", "36", "M", "MCA"
