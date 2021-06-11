def reverse_words(str)
  reverse_array = str.split(" ").map do |word|
    word.reverse if word.size >= 5
  end
  reverse_array.join(" ")
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
