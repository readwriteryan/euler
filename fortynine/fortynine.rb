require 'prime'
require 'mathn'
require 'set'
generator	= Prime::EratosthenesGenerator.new
primes		= Set.new

prime = generator.next
while prime < 1000
	prime = generator.next
end

#Generate primes between 1000 and 9999
primes << prime
while prime < 9999
	prime = generator.next
	primes << prime if prime < 9999
end

prime_permutations = []
used = Set.new
primes.each do |current_prime|
	next if used.include?(current_prime)

	permutations = current_prime.to_s.split('').permutation.to_a.map(&:join).uniq
	
	valid = []
	permutations.each do |permuted|
		if permuted.to_i > 1000 && permuted.to_i.prime?
			valid << permuted.to_i
			used << permuted.to_i
		end
	end
	
	prime_permutations << valid if valid.size > 2
end

prime_permutations.each do |prime_array|
	valid = prime_array.permutation(3).to_a.sort
	valid.each do |current|
		if (current[0] + current[1] + current[2]) / 3 == current[1]
			puts current[0].to_s + current[1].to_s + current[2].to_s
		end
	end
end
