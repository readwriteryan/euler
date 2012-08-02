require "prime"
generator	= Prime::EratosthenesGenerator.new

prime = generator.next
primes = {prime => 1}
count = 1
while count < 10000
    prime = generator.next
    primes[prime] = 1
    count +=1
end

max_sequence = 0
max_a = 0
max_b = 0
(-999..999).each do |a|
    (-999..999).each do |b|
	n = 0
	sequence = 0
	while true
	    if primes[((n * n) + (a * n) + b)] != nil
		sequence += 1
		n += 1
	    else
		break
	    end
	end
	
	if sequence > max_sequence
	    max_sequence = sequence
	    max_a = a
	    max_b = b
	end
    end
end

puts max_a * max_b
