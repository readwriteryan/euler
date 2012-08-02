#!/usr/bin/ruby
require "prime"

need_primes	= 10001
generator	= Prime::EratosthenesGenerator.new
count		= 0
until count == need_primes do
  count 	+= 1
  new_prime 	= generator.next
end

puts new_prime