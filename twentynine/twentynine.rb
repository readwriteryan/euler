totals = []
 (2..100).each do |a|
  (2..100).each do |b|
  totals << a ** b
  end
 end
 
 puts totals.uniq!.count