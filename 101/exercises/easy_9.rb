# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title.
def greetings(name_array, role_hash)
  "Hello #{name_array.join(' ')}! Nice to have a #{role_hash[:title]} #{role_hash[:occupation]} around."
end

##############################
# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.
def twice(num)
  num_string = num.to_s
  center = num_string.size / 2
  return num if num_string[0..center-1] == num_string[center..-1] && num_string.size > 1
  num*2
end

##############################
# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.
def negative(num)
  if num > 0
    -num
  else
    num
  end
end

##############################
# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.
# You may assume that the argument will always be a valid integer that is greater than 0.
def sequence(num)
  (1..num).to_a
end

##############################
# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.
def uppercase?(string)
  string == string.upcase
end

##############################
# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.
# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.
def word_lengths(string)
  string.split.map do |word|
    "#{word} #{word.size}"
  end
end

##############################
# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.
def swap_name(name)
  name_arr = name.split.reverse.join(', ')
end

##############################
# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.
# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.
def sequence(count, start)
  num_arr = Array.new
  1.upto(count) do |num|
    num_arr << start*num
  end
  num_arr
end

##############################
# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
def get_grade(score_1, score_2, score_3)
  grades = [score_1, score_2, score_3]
  avg = grades.reduce(:+) / grades.size
  case
  when avg >= 90 then "A"
  when avg >= 80 then "B"
  when avg >= 70 then "C"
  when avg >= 60 then "D"
  else "F"
  end
end

##############################
# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.
def buy_fruit(fruits_quantities)
  final = []
  fruits_quantities.each do |fruit|
    fruit[1].times { final << fruit[0] }
  end
  final
end 
