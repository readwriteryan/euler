require 'prime'
require 'set'
generator 	= Prime::EratosthenesGenerator.new
primes 		= Set.new

primes << generator.next;

current = 1;
while true
  current += 2
  while primes.max < current
    primes << generator.next
  end

  found = false  
  
  primes.each do |prime|
    base = 1
    while prime + (2 * (base ** 2)) <= current
      if prime + (2 * (base ** 2)) == current
	found = true
	break
      end
      
      base += 1
    end
    break if found
  end
  
  if !found && !current.prime?
    puts current
    break
  end
end