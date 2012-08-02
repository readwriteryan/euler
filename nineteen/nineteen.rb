require 'date'
puts Date.new(1901, 1, 1).upto(Date.new(2000, 12, 31)).select{|date| date.mday == 1 && date.wday == 0}.count