# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

def word_sizes(string_of_words)
  array_of_word_sizes = string_of_words.split.map {|word| word.size}

  word_size_hash = Hash.new

  array_of_word_sizes.each do |word_size|
    if !word_size_hash.has_key?(word_size)
      word_size_hash[word_size] = array_of_word_sizes.select{|x| x == word_size}.length
    end
  end

  word_size_hash
end

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     counts[word.size] += 1
#   end
#   counts
# end
