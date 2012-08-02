$pell = [0, 1]
def pell number
  return number if number == 0 || number == 1
  $pell[number] = 2 * $pell[number - 1] + $pell[number - 2]
end


puts (2..1001).select { |number| (pell(number - 1) + pell(number)).to_s.size > pell(number).to_s.size }.size