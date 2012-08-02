string = ''
i = 1
while string.length < 1000000
    string += i.to_s
    i += 1
end

puts string[0].to_i * string[9].to_i * string[99].to_i * string[999].to_i * string[9999].to_i * string[99999].to_i * string[999999].to_i;