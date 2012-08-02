class Fixnum
  def divisors
    number = self
    divisors = Array.new()
    divisors << 1
    
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

  def abundant?
    divisors_sum = self.divisors.inject(:+)
    divisors_sum > self
  end
end

def getNextAbundant previous
  test = previous + 1
  until test.abundant?
    test += 1
  end
  
  test
end

limit = 28123

abundant = [12]
sums = {24 => nil}

while abundant.last < limit
  abundant << getNextAbundant(abundant.last)
end

for i in (0..(abundant.count - 1))
  for j in ((i)..(abundant.count - 1))    
    sum = abundant[i] + abundant[j]
    
    if sum > limit
      break
    end
    
    sums.store sum, nil
  end
end

puts (1..limit).select{|n| !sums.include? n}.inject(:+)

=begin
not_found = Array.new()

for i in (1000..2000)
  puts "done #{i}" if i % 100 == 0
  found = false
  abundant.each do |number|
    if i < number
      break
    end
    
    if abundant.include?(i - number)
      found = true
      break
    end
  end
  
  not_found << i unless found
end
=end