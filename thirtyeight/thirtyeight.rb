max = 0

(1..9999).each do |outer|
    string_num = ''
    (1..9).each do |inner|
	result = outer * inner
	result_string = result.to_s
	string_num += result_string
	
	if string_num.size >= 9 || result_string.size >= 5
	    break;
	end
    end
    
    if string_num.size == 9 && string_num.split('').sort().join('') == "123456789"
	if(string_num.to_i > max)
	    max = string_num.to_i
	end
    end
end

puts max