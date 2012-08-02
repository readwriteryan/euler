#!/usr/bin/ruby
require "prime"

sum = 0;
generator = Prime::EratosthenesGenerator.new
new_prime = generator.next;

while new_prime < 2000000 do
  sum += new_prime
  new_prime = generator.next
end

puts sum
