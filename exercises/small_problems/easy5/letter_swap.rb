def swap(string)
  words = string.split(' ')
  new_words = words.map do |word|
    first = word[0]
    last = word[-1]

    word[0] = last
    word[-1] = first
  end

  words.join(' ')
end