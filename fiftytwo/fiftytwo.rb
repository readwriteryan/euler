def findMatch(base_number)
  (base_number..base_number * 10 / 6).each do |check_number|
    return check_number if (2..6).all? { |multiplier| (check_number * multiplier).to_s.split('').sort.join == check_number.to_s.split('').sort.join }
  end
  
  findMatch(base_number * 10)
end

puts findMatch(1000)