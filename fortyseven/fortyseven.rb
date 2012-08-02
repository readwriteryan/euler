require 'prime'
require 'set'
generator 	= Prime::EratosthenesGenerator.new
primes 		= Set.new

class Fixnum
    def divisors
    number = self
    divisors = Set.new
    divisors << 1
    divisors << self
    
    i = 2
    limit = Math.sqrt(number)
    while i <= limit
      if number % i == 0
	divisors << (number / i) unless divisors.include?(number / i)
	divisors << i unless divisors.include? i
      end
      
       i += 1
    end
    divisors
    end
end


current = generator.next
while current < 1000000
    primes << current
    current = generator.next;
end

i = 1000;
consecutive = 0
while true
    divisors = i.divisors
    count = 0
    divisors.each do |divisor|
	count += 1 if primes.include? divisor
    end
    
    if count >= 4
	consecutive +=1
    else
	consecutive = 0
    end
    
    break if consecutive == 4
    
    i += 1
end

puts i
