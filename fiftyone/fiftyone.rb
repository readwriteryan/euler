require 'set'
require 'prime'
primes 		= Set.new
generator	= Prime::EratosthenesGenerator.new

prime = generator.next
while prime < 1000000 do
prime = generator.next
primes << prime if prime >= 100 && prime < 1000000
end

primes.each do |check_prime|
  check_prime = check_prime.to_s
  (0..check_prime.length - 1).each do |left|
    (left + 1..check_prime.length - 1).each do |right|
      (right + 1..check_prime.length - 1).each do |more_right|
	  count = 0
	  used = Set.new
	  (0..9).each do |replace|
	    new_prime		= check_prime.dup
	    new_prime[left] 	= replace.to_s
	    new_prime[right] 	= replace.to_s
	    new_prime[more_right] = replace.to_s
	    if new_prime.to_i.to_s.size == check_prime.size && check_prime.to_i != new_prime.to_i && primes.include?(new_prime.to_i) && !used.include?(new_prime.to_i)
	      used << new_prime.to_i
	      count += 1
	    end
	  end
	  if count == 8
	    puts used.inspect
	    exit
	  end  
      end
    end
  end
end
