def analyze values
  values.select { |letter| letter =~ /[a-zA-Z\s]/ }.size.to_f / values.size.to_f > 0.90
end

$characters = IO.read('cipher1.txt').split(',')

def decrypt key
  if key.size < 3
    ('a'..'z').each { |character| decrypt(key + character) }
  else
    decrypted = []
    (0..$characters.size - 1).each do |i|
      decrypted << ($characters[i].to_i ^ key[i % 3].ord).chr
    end
    puts decrypted.inject(0) { |sum, character| sum + character.ord} if analyze(decrypted)
  end
end

decrypt('')