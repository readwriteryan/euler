require 'prime'
require 'set'

generator	= Prime::EratosthenesGenerator.new
prime		= generator.next
primes 		= Set.new

while prime < 1000000
    primes << prime
    prime = generator.next;
end

puts primes.select{ |prime| (1..(prime.to_s.length - 1)).all? { |amount| primes.include?(prime.to_s.split('').rotate(amount).join('').to_i)}}.size