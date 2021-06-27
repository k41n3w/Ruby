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
