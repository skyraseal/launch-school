# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(array_1, array_2)
  combined_array = []
  array_1.each_with_index do |element, index|
    combined_array << element << array_2[index]
  end
  combined_array
end

def interleave(array_1, array_2)
  array_1.zip(array_2).flatten
end

##############################
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.
ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
def letter_case_count(string)
  lowercase = 0
  uppercase = 0
  neither = 0
  string.each_char do |char|
    case char
    when *ALPHABET then lowercase += 1
    when *ALPHABET.map {|letter| letter.upcase} then uppercase += 1
    else neither += 1
    end
  end

  {lowercase: lowercase, uppercase: uppercase, neither: neither}
end

##############################
# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

##############################
# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.
def swapcase(string)
  lowercase_letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  uppercase_letters = lowercase_letters.map(&:upcase)
  new_string = ''
  string.each_char do |char|
    if lowercase_letters.include?(char)
      new_string << char.upcase
    elsif uppercase_letters.include?(char)
      new_string << char.downcase
    else
      new_string << char
    end
  end
  new_string
end
# I NEED TO START USING REGEX DANGIT.
def swapcase(string) # Book version
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

##############################
# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.
def staggered_case(string)
  counter = 0
  new_string = ''
  string.chars.each do |char|
    if char =~ /[0-9]/
      new_string << char
    else
      new_string << char.upcase if counter.even?
      new_string << char.downcase if counter.odd?
    end
    counter += 1
  end
  new_string
end

##############################
# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.
def staggered_case(string)
  counter = 0
  new_string = ''
  string.chars.each do |char|
    if char =~ /[0-9]/
      new_string << char
    else
      new_string << char.upcase if counter.even?
      new_string << char.downcase if counter.odd?
      counter += 1
    end
  end
  new_string
end

##############################
# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
def show_multiplicative_average(array)
  product = 1
  array.each do |num|
    product *= num
  end
  average = product.to_f / array.size
  puts "The result is #{format("%.3f", average)}"
end

##############################
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.
def multiply_list(array_1, array_2)
  mult_array = []
  array_1.each_with_index do |element, index|
    mult_array << element * array_2[index]
  end
  mult_array
end

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map {|subarray| subarray.reduce(:*)}
end

##############################
# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.
# You may assume that neither argument is an empty Array.
def multiply_all_pairs(array_1, array_2)
  final_array = []
  array_1.each do |num1|
    array_2.each do |num2|
      final_array << num1 * num2
    end
  end
  final_array.sort
end

##############################
# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.
def penultimate(string)
  string.split[-2]
end
