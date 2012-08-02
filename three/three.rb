require 'mathn'
Math.sqrt(600851475143).ceil.downto(2) { |divisor| if 600851475143 % divisor == 0 && divisor.prime? then puts divisor; break end }