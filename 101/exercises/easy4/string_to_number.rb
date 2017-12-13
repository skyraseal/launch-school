# Create a method that converts a numeric string to an integer without using the .to_i method

def identify_digit(string)
  return 1 if string == "1"
  return 2 if string == "2"
  return 3 if string == "3"
  return 4 if string == "4"
  return 5 if string == "5"
  return 6 if string == "6"
  return 7 if string == "7"
  return 8 if string == "8"
  return 9 if string == "9"
  return 0 if string == "0"
end

def string_to_integer(string)
  place = 1
  total = 0

  if string[0] == "-" || string[0] == "+"
    sign = string[0]
    string = string[1, (string.length - 1)]
  end

  until string.length == 0
    number = identify_digit(string[-1])
    number *= place
    total += number

    string = string.chop
    place *= 10
  end
  total *= -1 if sign == "-"
  total
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

#Book Solution uses a constant hash for the digits.
#Uses String#chars then Array#map to procedurally replace each string with Fixnum value.
#Then use Array#each to put the number together from start to end. In comparison, I put the number together from end to start. Start to end is probably better.

# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }
#
# def string_to_integer(string)
#   digits = string.chars.map { |char| DIGITS[char] }
#
#   value = 0
#   digits.each { |digit| value = 10 * value + digit }
#   value
# end
