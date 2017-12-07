#My long thought method
=begin
def reverse_sentence(str)
  array = str.split(" ")
  reverse_array = array.reverse!
  reverse_sentence = reverse_array.join(" ")
end
=end

#Book method that combines everything.
#Cleaner to read and use.
def reverse_sentence(str)
  string.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
