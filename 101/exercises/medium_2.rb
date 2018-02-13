# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.
text = File.read('sample_text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size  }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

##############################
# A collection of spelling blocks has two letters per block, as shown in this list
blocks = %w(B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M)
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.
def block_word?(word)
  blocks = %w(B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M)
  unusable_letters = []
  word.upcase.chars.each do |char|
    return false if unusable_letters.include?(char)
    blocks.each do |block|
      if block[0] == char
        unusable_letters << block[-1]
      elsif block[-1] == char
        unusable_letters << block[0]
      end
    end
  end
  true
end

##############################
# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.
# You may assume that the string will always contain at least one character.
def letter_percentages(string)
  total_characters = string.size.to_f
  lowercase_characters = 0
  uppercase_characters = 0
  neither_characters = 0

  string.chars.each do |char|
    if 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.include?(char)
      uppercase_characters += 1
    elsif 'abcdefghijklmnopqrstuvwxyz'.include?(char)
      lowercase_characters += 1
    else
      neither_characters += 1
    end
  end

  {lowercase: lowercase_characters/total_characters*100, uppercase: uppercase_characters/total_characters*100, neither: neither_characters/total_characters*100}
end

##############################
# Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Note that balanced pairs must each start with a (, not a ).
def balanced?(string)
  counter = 0
  string.each_char do |char|
    return false if counter < 0
    counter += 1 if char == '('
    counter -= 1 if char == ')'
  end
  if counter == 0
    true
  else
    false
  end
end

##############################
# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.
def triangle(side1, side2, side3)
  tri = [side1, side2, side3].sort
  if tri[0] + tri[1] < tri[2] || tri.include?(0)
    :invalid
  elsif tri.uniq.size == 1
    :equilateral
  elsif tri.uniq.size == 2
    :isosceles
  else
    :scalene
  end
end

##############################
# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.
# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.
def triangle(angle1, angle2, angle3)
  tri = [angle1, angle2, angle3]
  if tri.min <= 0 || tri.reduce(:+) != 180
    :invalid
  elsif tri.include?(90)
    :right
  elsif tri.max > 90
    :obtuse
  else
    acute
  end
end

##############################
# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    day = Time.new(year, month, 13)
    count += 1 if day.friday?
  end
  count
end

##############################
# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.
# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).
#multiple of 7
#uniq digits
#odd
def featured(num)
  loop do
    num += 1
    return num if num.odd? && num%7 == 0 && num.to_s.chars.uniq.join.to_i == num
    return 'No possible number' if num >= 9_999_999_999
  end
  num
end

##############################
# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

def bubble_sort!(array)
  array_length = array.size
  loop do
    swap = false
    0.upto(array_length - 2) do |index|
      if array[index] > array[index+1]
        array[index], array[index+1] = array[index+1], array[index]
        swap = true
      end
    end
    break if swap == false
  end
  array
end

##############################
# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.
def sum_square_difference(n)
  square_of_sum = (1..n).to_a.reduce(:+)
  square_of_sum  *= square_of_sum

  sum_of_squares = (1..n).to_a.map{|int| int*int}.reduce(:+)

  square_of_sum - sum_of_squares
end
