valid = []
 
(1..9999).each do |outer|
    (1..99).each do |inner|
	result = outer * inner
	string = (result.to_s + outer.to_s + inner.to_s).split('').sort.join('')
	
	if(string.length == 9 && string == "123456789")
	    valid << result unless valid.include? result
	end
    end
end

puts valid.inject(:+)