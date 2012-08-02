$coins = [1, 2, 5, 10, 20, 50, 100, 200];

def recurse level, sum
  if sum == 0
    return 1
  elsif sum < 0 || level < 0
    return 0
  end
  
  return recurse(level, sum - $coins[level]) + recurse(level - 1, sum)
end

puts recurse(7, 200)
