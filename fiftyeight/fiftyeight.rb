require 'mathn'

primes = 0
current = 1
(1..20000).each do |level|
    (0..3).each do |iteration|
      current += (level * 2)
      primes += 1 if(current.prime?)
    end
    
    value = (primes / (level * 4 + 1))
    puts value.to_f
    
    if((primes / (level * 4 + 1)).to_f < (1/10).to_f)
	puts 2 * level + 1
	break;
    end
end