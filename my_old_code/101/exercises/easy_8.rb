# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.
def sum_of_sums(array)
  total = 0
  prev = 0
  array.each do |num|
    total += prev + num
    prev += num
  end
  total
end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count| #each time, slice will put the correct amount integers together and reduce will add them
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

##############################
# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.
def user_enter(word_class)
  print "Enter a #{word_class}: "
  user_output = gets.chomp
end

noun = user_enter('noun')
verb = user_enter('verb')
adjective = user_enter('adjective')
adverb = user_enter('adverb')

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

##############################
# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
def substrings_at_start(string)
  substring_array = []
  count = 1
  until count == (string.size+1) do
    substring_array << string[0, count]
    count += 1
  end
  substring_array
end

##############################
# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
# You may (and should) use the substrings_at_start method you wrote in the previous exercise.
def substrings(string)
  results = []
  0.upto(string.size-1) do |starting_index|
    results << substrings_at_start(string[starting_index..-1])
  end
  results.flatten
end

##############################
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
# You may (and should) use the substrings method you wrote in the previous exercise.
# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
def palindromes(string)
  all_substrings = substrings(string)
  palindromes = []
  all_substrings.each do |substring|
    palindromes << substring if substring  == substring.reverse unless substring.size == 1
  end
  palindromes
end

##############################
# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(first_num, last_num)
  results = []
  (first_num..last_num).each do |integer|
    results << if integer == 0
      integer
    elsif integer % 3 == 0 && integer % 5 == 0
      "FizzBuzz"
    elsif integer % 3 == 0
      "Fizz"
    elsif integer % 5 == 0
      "Buzz"
    else
      integer
    end
  end
  puts results.join(', ')
end

##############################
# Write a method that takes a string, and returns a new string in which every character is doubled.
def repeater(string)
  doubled_string = ''
  string.each_char do |char|
    doubled_string << char*2
  end
  doubled_string
end

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.
def double_consonants(string)
  doubled_string = ''
  string.each_char do |char|
    doubled_string << if char =~ /[aeiouAEIOU]/
                        char
                      elsif char =~ /[A-Za-z]/
                        char*2
                      else
                        char
                      end
  end
  doubled_string
end

##############################
# Write a method that takes a positive integer as an argument and returns that number with its digits reversed.
def reversed_number(number)
  number.to_s.reverse.to_i
end

##############################
# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.
def center_of(string)
  if string.size.odd?
    return string[(string.size/2.0).ceil - 1]
  else
    return string[string.size/2 - 1, 2]
  end
end
