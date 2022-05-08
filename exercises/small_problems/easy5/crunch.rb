def crunch(string)
  # iterate each character
  # add character to new string, go to next
  # if same character, skip to next char
  return_string = ''

  string.each_char do |char|
    return_string << char if return_string[-1] != char
  end

  return_string
end