def fully_divisible number
  (2..20).all? { |divisor| number % divisor == 0 }
end

current = 20
until(fully_divisible current) do current += 2 end

puts current