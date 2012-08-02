require 'set'

triangles	= Set.new
triangle 	= 1;
n		= 1;
while triangle <= 520
    triangles << triangle
    n += 1
    triangle = ((n.to_f / 2.to_f) * (n + 1)).to_i
end

string = ''
file = File.new("words", "r")
while line = file.gets
    string += line
end

puts string.gsub('"', '').split(',').select { |word| triangles.include?(word.split('').map {|char| char.getbyte(0) - 64}.inject(:+)) }.size