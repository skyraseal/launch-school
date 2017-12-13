#Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

def century(year)
  return '0th or before' if year <= 0
  century = ((year-1)/100 + 1).to_s

  if century[-2,2] == "11" || century[-2,2] == "12"  || century[-2,2] == "13"
    century << "th"
  elsif century[-1] == "1"
    century << "st"
  elsif century[-1] == "2"
    century << "nd"
  elsif century[-1] == "3"
    century << "rd"
  else
    century << "th"
  end
end

p century(0)
p century(201)
p century(1001)
p century(1230)
p century(1456)
p century(2001)
p century(2304)

#Book method
#Using 'case' made code easier to read. Splitting into two methods easier to read.  Modulus vs string was just a different way of identifying what suffix to use.
#def century(year)
#  century = year / 100 + 1
#  century -= 1 if year % 100 == 0
#  century.to_s + century_suffix(century)
#end

#def century_suffix(century)
#  return 'th' if [11, 12, 13].include?(century % 100)
#  last_digit = century % 10
#
#  case last_digit
#  when 1 then 'st'
#  when 2 then 'nd'
#  when 3 then 'rd'
#  else 'th'
#  end
#end
