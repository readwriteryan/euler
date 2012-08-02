$perimiter = {}
 (1..500).each do |a|
  (1..500).each do |b|
    (b..500).each do |c|
      break if((a+b+c) > 1000)
      $perimiter[a+b+c] ||= 0
      $perimiter[a+b+c] += 1 if((a**2) + (b**2) == (c**2))
    end
  end
 end
 
puts $perimiter.sort.inspect