def palindromic? number
  number.to_s == number.to_s.reverse
end

def lychrel? number
  50.times { return false if palindromic?(number = (number + number.to_s.split('').reverse.join('').to_i)) }
  true
end

puts (1..9999).select{|number| lychrel? number}.size