class String
    def palindromic?
	self == self.reverse
    end
end

puts (1..1000000).select { |number| number.to_s.palindromic? && number.to_s(2).palindromic?}.inject(:+);