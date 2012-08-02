require 'set'

triangle	= Set.new
pentagonal	= Set.new
hexagonal	= Set.new

n = 0
while n < 100000 && n += 1
    triangle << (n * (n + 1)) / 2
    pentagonal << (n * (3 * n - 1)) / 2
    hexagonal << (n * (2 * n - 1))
end

puts triangle.select { |triangle| pentagonal.include?(triangle) && hexagonal.include?(triangle)}[2]