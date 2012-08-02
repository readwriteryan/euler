total = 1
current = 1
(1..500).each do |level|
    (0..3).each do |iteration|
      current += (level * 2)
      total += current
    end
end

puts total