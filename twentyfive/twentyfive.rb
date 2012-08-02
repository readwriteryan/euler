$fibonacci = [0, 1, 1]

current = 3
while $fibonacci.last.to_s.length < 1000
  $fibonacci[current] = $fibonacci[current - 1] + $fibonacci[current - 2]
  current += 1
end

puts current - 1