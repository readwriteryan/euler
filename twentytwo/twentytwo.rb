names = File.open('names.txt').gets.gsub!(/"/, "").split(",").sort
i = 1
total = 0
names.each do |name|
  name_score = 0
  name.each_byte do |byte|
    name_score += byte - 64
  end
  name_score *= i
  total += name_score
  i += 1
end

puts total