#!/usr/bin/ruby
$lengths = Hash.new();
$lengths[1.to_s]= 3
$lengths[2.to_s]	= 3
$lengths[3.to_s]	= 5
$lengths[4.to_s]	= 4
$lengths[5.to_s]	= 4
$lengths[6.to_s]	= 3
$lengths[7.to_s]	= 5
$lengths[8.to_s]	= 5
$lengths[9.to_s]	= 4
$lengths[10.to_s]= 3
$lengths[11.to_s]= 6
$lengths[12.to_s]= 6
$lengths[13.to_s]= 8
$lengths[14.to_s]= 8
$lengths[15.to_s] = 7
$lengths[16.to_s] = 7
$lengths[17.to_s] = 9
$lengths[18.to_s] = 8
$lengths[19.to_s] = 8
$lengths[20.to_s] = 6
$lengths[30.to_s]= 6
$lengths[40.to_s] = 5
$lengths[50.to_s] = 5
$lengths[60.to_s] = 5
$lengths[70.to_s] = 7
$lengths[80.to_s] = 6
$lengths[90.to_s] = 6
$lengths[100.to_s] = 10
$lengths[1000.to_s] = 8

def getCount number
  
  if number == 1000
    return $lengths[1000.to_s] + $lengths[1.to_s]
  elsif number == 0
      return 0
  elsif number > 900
    return $lengths[9.to_s] + $lengths[100.to_s] + getCount(number - 900)
  elsif number == 900
    return $lengths[9.to_s] + 7
  elsif number > 800
    return $lengths[8.to_s] + $lengths[100.to_s] + getCount(number - 800)
  elsif number == 800
    return $lengths[8.to_s] + 7
  elsif number > 700
    return $lengths[7.to_s] + $lengths[100.to_s] + getCount(number - 700)
  elsif number == 700
    return $lengths[7.to_s] + 7
  elsif number > 600
    return $lengths[6.to_s] + $lengths[100.to_s] + getCount(number - 600)
  elsif number == 600
    return $lengths[6.to_s] + 7
  elsif number > 500
    return $lengths[5.to_s] + $lengths[100.to_s] + getCount(number - 500)
  elsif number == 500
    return $lengths[5.to_s] + 7
  elsif number > 400
    return $lengths[4.to_s] + $lengths[100.to_s] + getCount(number - 400)
  elsif number == 400
    return $lengths[4.to_s] + 7
  elsif number > 300
    return $lengths[3.to_s] + $lengths[100.to_s] + getCount(number - 300)
  elsif number == 300
    return $lengths[3.to_s] + 7
  elsif number > 200
    return $lengths[2.to_s] + $lengths[100.to_s] + getCount(number - 200)
  elsif number == 200
    return $lengths[2.to_s] + 7
  elsif number > 100
    return $lengths[1.to_s] + $lengths[100.to_s] + getCount(number - 100)
  elsif number == 100
    return $lengths[1.to_s] + 7
  elsif number >= 90
    return $lengths[90.to_s] + getCount(number - 90)
  elsif number >= 80
    return $lengths[80.to_s] + getCount(number - 80)
  elsif number >= 70
    return $lengths[70.to_s] + getCount(number - 70)
  elsif number >= 60
    return $lengths[60.to_s] + getCount(number - 60)
  elsif number >= 50
    return $lengths[50.to_s] + getCount(number - 50)
  elsif number >= 40
    return $lengths[40.to_s] + getCount(number - 40)
  elsif number >= 30
    return $lengths[30.to_s] + getCount(number - 30)
  elsif number >= 20
    return $lengths[20.to_s] + getCount(number - 20)
  elsif number == 19
    return $lengths[19.to_s]
  elsif number == 18
    return $lengths[18.to_s]
  elsif number == 17
    return $lengths[17.to_s]
  elsif number == 16
    return $lengths[16.to_s]
  elsif number == 15
    return $lengths[15.to_s]
  elsif number == 14
    return $lengths[14.to_s]
  elsif number == 13
    return $lengths[13.to_s]
  elsif number == 12
    return $lengths[12.to_s]
  elsif number == 11
    return $lengths[11.to_s]
  else
    return $lengths[number.to_s]
  end
end

i = 1000
count = 0
temp_count = 0
while i >=1
  temp_count = getCount(i)
  count += temp_count
  puts i.to_s + ":" + temp_count.to_s
  i -= 1
end

puts count