class Fixnum
    def divisors
    number = self
    divisors = Array.new()
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

def gcd first, second
    (first.divisors & second.divisors).max
end

numerators = []
denominators = []
 (1..99).each do |numerator|
  ((numerator + 1)..99).each do |denominator|
    numerator_numbers = numerator.to_s.split('')
    denominator_numbers = denominator.to_s.split('')
    
    numerator_numbers.each do |num|
      if num == "0"
	next
      end
      
      if(denominator_numbers.include?(num))
	if denominator.to_s.sub(num.to_s, '').to_i != 0
	    if (numerator.to_s.sub(num.to_s, '').to_f / denominator.to_s.sub(num.to_s, '').to_f == (numerator.to_f / denominator.to_f))
	      numerators << numerator
	      denominators << denominator
	    end
	end
      end    
    end
  end
end

new_numerator = numerators.inject(:*)
new_denominator = denominators.inject(:*)


divisor = gcd(new_numerator, new_denominator)

new_numerator /= divisor
new_denominator /= divisor

puts new_numerator.to_s + "/" + new_denominator.to_s