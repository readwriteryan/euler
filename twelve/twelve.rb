#!/usr/bin/ruby
require 'prime'
def triangle_number n, current
  current + n
end

need_primes	= 10000
generator	= Prime::EratosthenesGenerator.new
count		= 0

primes = Array.new()
until count == need_primes do
  count 	+= 1
  primes 	<< generator.next
end

i = 1
divisors = 0
triangle_number = 0
while divisors < 500
  prime_count 	= {}
  triangle_number = triangle_number i, triangle_number
  current	= triangle_number
  max		= triangle_number / 2
  continue	= true  
  
  while continue
    
    if primes.include?(current)
      if prime_count[current] == nil
	prime_count[current] = 1
      else
	prime_count[current] += 1
      end
      
      break
    end
    
    primes.each do |prime|
      
      if prime > max
	continue = false
	break;
      end
      
      if(current % prime == 0)
	current /= prime
	if prime_count[prime] == nil
	  prime_count[prime] = 1
	else
	  prime_count[prime] += 1
	end
	
	break
      end
    end
  end
  
  divisors = 1
  prime_count.each do |key, value|
    divisors *= (value + 1)
  end
  
  i += 1
end

puts triangle_number
