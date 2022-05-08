def char_to_int(char)
  char_int_list = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }

  char_int_list[char]
end

def negative?(string)
  string[0] == '-'
end

def string_to_integer(string)
  multiplier = 10**(string.length - 1)
  return_number = 0

  string.each_char do |char|
    return_number += char_to_int(char) * multiplier
    multiplier /= 10
  end

  return_number
end

def string_to_signed_integer(string)
  negative = negative?(string)
  string = string[1..-1] if ['+', '-'].include?(string[0])

  if negative
    string_to_integer(string) * -1
  else
    string_to_integer(string)
  end
end