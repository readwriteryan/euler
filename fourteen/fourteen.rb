def manip number
  
  if number % 2 == 0
    number /= 2
  else
    number = (number * 3) + 1
  end
  
  number
end

current	= 999999
max_seq	= 0;
max_start = 999999

while current > 0
  
  cur_seq 	= 0
  temp 	= current
  
  while temp != 1
    cur_seq	+= 1
    temp	= manip temp
  end
  
  if cur_seq > max_seq
    max_seq	= cur_seq
    max_start	= current
  end
  
  current -= 1
end

puts max_start
