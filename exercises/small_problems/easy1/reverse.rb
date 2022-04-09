# input string
# output string with the words reversed

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

def reverse_words(string)
  string.split.map {|word| if word.length > 4; word.reverse; else word; end}.join(' ')
end
