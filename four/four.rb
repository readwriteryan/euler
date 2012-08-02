valid = (999).downto(100).to_a.combination(2).map do |combined|
  product = (combined[0] * combined[1]).to_s
  product == product.reverse ? product.to_i : 0
end

puts valid.max