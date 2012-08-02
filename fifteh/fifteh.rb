require 'prime'
require 'set'

generator	= Prime::EratosthenesGenerator.new
primes		= []

prime = generator.next
while prime < 1000000
  primes << prime
  prime = generator.next
end

max_sequence = {}
(0..primes.size - 1).each do |index|
  
  current_prime = primes[index]
  total			= current_prime
  count			= 1
  (index + 1..primes.size - 1).each do |new_index|
	  total += primes[new_index]
	  break if total > 1000000
	  
	  count += 1
	  max_sequence[total] = count if total.prime? && count > max_sequence[total].to_i
  end
end

puts max_sequence.max{ |a, b| a[1] <=> b[1] }