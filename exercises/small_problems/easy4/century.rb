# This method was a little to complex.  Should make a separate method to determine the suffix.
def century(year)
  number_endings = {
    '0' => 'th',
    '1' => 'st',
    '2' => 'nd',
    '3' => 'rd',
    '4' => 'th',
    '5' => 'th',
    '6' => 'th',
    '7' => 'th',
    '8' => 'th',
    '9' => 'th'}

  # calculate century
  # divide by 100 then add 1
  # if there is remainder add 1 again to get century
  century = (year)/100
  century += 1 if year%100 != 0

  century_string = century.to_s
  century_suffix = 
    if ['11', '12', '13'].include?(century_string[-2..-1])
      'th'
    else
      number_endings[century_string[-1]]
    end

  century_string+century_suffix
end

# this is the solution shown.

def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end