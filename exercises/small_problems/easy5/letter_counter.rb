def add_one_to_hash_key(hash, key)
  if hash[key] == nil 
    hash[key] = 1
  else 
    hash[key] += 1
  end
end

def word_sizes(string)
  word_size_hash = Hash.new

  string.split.each do |word|
    add_one_to_hash_key(word_size_hash, word.gsub(/[^A-Za-z]/, '').length)
  end

  word_size_hash
end

# you don't need the first method if you just initialize the hash with a default value of 0
# for all keys that don't exist yet.  then you can just add 1 to the value.
# read Hash#new