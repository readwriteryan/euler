$fibonacci = [1, 2]
def fibonacci(n)
	$fibonacci[n] ||= fibonacci(n - 1) + fibonacci(n - 2)
end

until((fibonacci($fibonacci.size)) >= 4000000) do end

puts $fibonacci.slice(0, $fibonacci.size - 1).select{ |fib| fib % 2 == 0 }.inject(:+)