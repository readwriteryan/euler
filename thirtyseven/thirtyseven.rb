require 'prime'
require 'set'

generator	= Prime::EratosthenesGenerator.new
prime		= generator.next;
$valid		= Set.new;
$primes		= Set.new;


def left number
  if number.to_s.size == 1 && $primes.include?(number)
    return true
  elsif number.to_s.size == 1
    return false
  end
  
  new_number = number.to_s.split('').slice(1..number.to_s.length).join('').to_i
  return left(new_number) && $primes.include?(number)
  
end

def right number
  if number.to_s.size == 1 && $primes.include?(number)
    return true
  elsif number.to_s.size == 1
    return false
  end
  new_number = number.to_s.split('').slice(0..(number.to_s.length - 2)).join('').to_i
  return right(new_number) && $primes.include?(number)
end

while $valid.size < 11
  $primes << prime;
  
  if(prime > 10)
    if left(prime) && right(prime)
      $valid << prime
    end
  end
  prime = generator.next
end

puts $valid.inject(:+)



