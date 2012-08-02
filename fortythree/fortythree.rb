valid = [];
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation.to_a.each do |permutation|  
  number = (permutation[1].to_s + permutation[2].to_s + permutation[3].to_s).to_i
  next if number % 2 != 0
  
  number = (permutation[2].to_s + permutation[3].to_s + permutation[4].to_s).to_i
  next if number % 3 != 0
  
  number = (permutation[3].to_s + permutation[4].to_s + permutation[5].to_s).to_i
  next if number % 5 != 0
  
  number = (permutation[4].to_s + permutation[5].to_s + permutation[6].to_s).to_i
  next if number % 7 != 0
  
  number = (permutation[5].to_s + permutation[6].to_s + permutation[7].to_s).to_i
  next if number % 11 != 0
  
  number = (permutation[6].to_s + permutation[7].to_s + permutation[8].to_s).to_i
  next if number % 13 != 0
  
  number = (permutation[7].to_s + permutation[8].to_s + permutation[9].to_s).to_i
  next if number % 17 != 0
  
  valid << permutation.join('').to_i
end

puts valid.inspect