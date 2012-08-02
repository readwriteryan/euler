sum = square_sum = 0

(1..100).each do |i|
  sum += i;
  square_sum += (i * i);
end

puts (sum * sum) - square_sum