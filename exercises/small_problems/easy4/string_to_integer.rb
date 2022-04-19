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

def string_to_integer(string)
  multiplier = 10**(string.length - 1)
  return_number = 0

  string.each_char do |char|
    return_number += char_to_int(char) * multiplier
    multiplier /= 10
  end

  return_number
end