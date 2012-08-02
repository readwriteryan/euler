require 'prime'

max = 0;
[1, 2, 3, 4, 5, 6, 7].permutation.to_a.map { |permu| max = permu.join('').to_i if permu.join('').to_i.prime? && permu.join('').to_i > max }

puts max;