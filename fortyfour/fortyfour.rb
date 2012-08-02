require 'set'

pentagonal = Set.new();
n = 0
while n < 10000 && n += 1
    pentagonal << (n * (3 * n - 1)) / 2
end

pentagonz = pentagonal.to_a

valid = []
(0..pentagonal.length - 1).each do |base_n|
    (base_n..pentagonal.length - 1).each do |peek_n|
	valid << [pentagonz[base_n], pentagonz[peek_n]] if pentagonal.include?(pentagonz[base_n] + pentagonz[peek_n]) && pentagonal.include?(pentagonz[peek_n] - pentagonz[base_n])
    end
end

min	= 9999999999
index	= 0
(0..valid.length - 1).each do |i|
    if (valid[i][0] - valid[i][1]).abs < min
	min = (valid[i][0] - valid[i][1]).abs
	index = i
    end
end

puts valid[index].inspect
puts min