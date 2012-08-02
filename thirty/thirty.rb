def coconut number
  total = 0  
  number.to_s.split('').map(&:to_i).each do |digit|
    total += digit ** 5
  end
  
  total
end

puts (1..999999).select{|t| t == coconut(t)}.inject(:+)