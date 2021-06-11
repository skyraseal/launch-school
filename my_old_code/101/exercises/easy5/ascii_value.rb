# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  length = string.length
  character_array = string.chars
  counter = 0
  total = 0

  until counter == length
    total += character_array[counter].ord
    counter += 1
  end
  total
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

#Book solution
#There is a String#each_char method!

# def ascii_value(string)
#   sum = 0
#   string.each_char { |char| sum += char.ord }
#   sum
# end
