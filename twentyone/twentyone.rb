def divisors number
  divisors = Array.new()
  divisors << 1
  
  limit = number
  
  i = 2
  limit = number / 2
  while i <= limit
    if number % i == 0
      limit = number / i
      divisors << limit unless divisors.include? limit
      divisors << i unless divisors.include? i
    end
    
    i += 1
  end
  
  divisors
end

def amicable? number
  sum = divisors(number).inject(:+)
  
  if sum == number
    return false
  end
  
  other = divisors(sum).inject(:+)
  
  if other == number
    return true
  end
  
  false
end

puts (1..9999).select{ |number| amicable? number}.inject(:+)