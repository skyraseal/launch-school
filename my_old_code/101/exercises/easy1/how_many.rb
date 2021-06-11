#This was my method
=begin
def count_array_to_hash(array)
  hash = Hash.new
  until array.length == 0
    word = array.shift
    if !hash.has_key?(word)
      hash[word] = 1
    else
      hash[word] += 1
    end
  end
  hash
end

def count_occurrences(array)
  hash = count_array_to_hash(array)
  hash.each do |k, v|
    puts "#{k} => #{v}"
  end
end
=end

#this is the cleaner method from the course
#instead of using array.shift and a counter, it uses a count method for the array class
def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
count_occurrences(vehicles)
