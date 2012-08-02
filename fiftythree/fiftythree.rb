$factorials = Hash.new(0)
def factorial(number)
	$factorials[number] > 0 ? $factorials[number] : number > 0 ? $factorials[number] = (1..number).inject(:*) : 1
end
def combinations(n)
	(1..n).select{ |r| (factorial(n) / (factorial(r) * factorial(n - r))) > 1000000 }.size
end

puts (1..100).map{ |n| combinations(n) }.inject(:+)