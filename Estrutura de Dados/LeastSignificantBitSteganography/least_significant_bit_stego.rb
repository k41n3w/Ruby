# Requer ImageMagick, Ruby 2.5, gem rmagick, gem chunky_png

require "rmagick"
require "chunky_png"

# Esteganografia simples de bits menos significativos.

# Os comandos devem ser rodados dentro do diretório:
#   Ruby/Estrutura de Dados/LeastSignificantBitSteganography
#
# Para codificar uma mensagem:
#   ruby least_significant_bit_stego.rb encode image_file mensagem encdoded_filename
#   ruby least_significant_bit_stego.rb encode fumassa.png 'O que procuras?' fumassa-with-message.png
#
# Para decodificar uma mensagem:
#   ruby least_significant_bit_stego.rb decode filename
#   ruby least_significant_bit_stego.rb decode fumassa-with-message.png

# Esconde uma mensagem no bit menos significativo do canal vermelho da imagem.
class LSB
  include ChunkyPNG

  def initialize(filename:)
    @filename = convert_to_png(filename)
    @img = Image.from_file(@filename)
  end

  def encode(message:, stego_filename:) # rubocop:disable Metrics/MethodLength
    message = message.force_encoding("UTF-8")
    unless message.ascii_only?
      puts "Só é aceito caracteres do tipo ascii na mensagem."
      return 1
    end

    binary_message = message.unpack1("B*").split(//).map(&:to_i)

    if img.area < binary_message.size
      puts "A message requer #{binary_message.size} pixels para codificar e a "\
        "imagem contém somente #{img.area} pixels."
      return 1
    end

    binary_message += [0] * (img.area - binary_message.size)

    img.height.times do |y|
      img.width.times do |x|
        img[x, y] = encode_pixel(img[x, y],
                                 binary_message[y * img.width + x])
      end
    end

    img.save(stego_filename)

    0
  end

  def decode
    message = []
    img.height.times do |y|
      img.width.times do |x|
        message << (Color.r(img[x, y]) % 2)
      end
    end

    message.each_slice(8).map { |s| s.map(&:to_s).join("") }
           .map { |s| [s].pack("B*") }.join("")
  end

  private

  attr_reader :img, :filename

  def convert_to_png(file)
    return file if file.split(".")[1] == "png"

    img = Magick::Image.read(file)[0]
    img.format = "png"
    png_name = file.split(".")[0] + ".png"
    img.write(png_name)
    png_name
  end

  def encode_pixel(pixel, bit)
    return pixel if (Color.r(pixel) + bit).even?

    Color.rgba(Color.r(pixel) + 1, Color.g(pixel),
               Color.b(pixel), Color.a(pixel))
  end
end

mode, filename = ARGV

lsb = LSB.new(filename: filename)
if mode == "encode"
  result = lsb.encode(message: ARGV[2].dup,
                      stego_filename: ARGV[3])
  if result == 0
    puts "Successo!"
  else
    puts "Falha ao codificar."
  end
elsif mode == "decode"
  puts lsb.decode
end
