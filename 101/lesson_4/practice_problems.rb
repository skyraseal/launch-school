## Methods and More Methods 
# 1
# Q: What is the return value of the select method below? Why?
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# A: The return value will be [1,2,3].  The block always ends up with a truthy return value,
# since 'hi' is not considered a false or nil value.

# 2
# Q: How does count treat the block's return value? How can we find out?
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# A: If an optional block is passed into the count method, 
# only elements that evaluate as truthy will count.  So the return value should be 1.

# 3
# Q: What is the return value of reject in the following code? Why?
[1, 2, 3].reject do |num|
  puts num
end
# A: Array's reject method returns a collection of the non-truthy elements. Since the
# block return is always nil, [1,2,3] should be returned

# 4
# Q: What is the return value of each_with_object in the following code? Why?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# A: {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
# value represents each element of the array that the method is called on.
# hash represents the hash that was passed into the argument.

# 5
# Q: What does shift do in the following code? How can we find out?
hash = { a: 'ant', b: 'bear' }
hash.shift
# A: It destroys the first key value pair from the hash and also returns that pair as an array.
# Checked the ruby documentation.

# 6
# Q: What is the return value of the following statement? Why?
['ant', 'bear', 'caterpillar'].pop.size
# A: Pop is called on the array first, then size is called on the returned value from pop.
# => 'caterpillar'  then => 11.  so 11 is the final return

# 7
# Q: What is the block's return value in the following code? How is it determined? 
# Also, what is the return value of any? in this code and what does it output?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# A: Evaluates the first element of the collection, 1.  The block will return true, so the iteration
# from #any? will end there and return true.

# 8
# Q: How does take work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
arr.take(2)
# A: Take returns the first n elements from an enumerable. In this case, it will take the first
# two elements and return the array [1, 2]

# 9
# Q: What is the return value of map in the following code? Why?
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# A: Map returns an array of the return values from each iteration. In this case,
# the return is [nil, 'bear']

# 10
# Q: What is the return value of the following code? Why?
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# A: [1, nil, nil] is the return.  The puts method always returns nil.

## Additional Practice 
# 1 
# Q: Turn this array into a hash where the names are the keys 
# and the values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# A: 
flintstones_hash = {}
flintstones.each_with_index do |person, position|
  flintstones_hash[person] = position
end

# 2
# Q: Add up all of the ages from the Munster family hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# A:
all_ages = 0
ages.each {|person, age| all_ages += age}
all_ages

# 3
# Q: remove people with age 100 and greater
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# A:
ages.delete_if {|_, age| age >= 100}
ages 

# 4
# Q: Pick out the minimum age from our current Munster family hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# A:
min_age = ages.values.min

# 5
# Q: Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# A: 
flintstones.find_index {|name| name[0..2].downcase == "be"}

# 6
# Q: Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# A:
flintstones.map! {|name| name[0..3]}

# 7
# Q: Create a hash that expresses the frequency with which each letter occurs in this string
statement = "The Flintstones Rock"
# A: it ended up pretty different than the example answer given. the example answer
# made an array of every alphabet letter first, then went through that array and did a count
# on the original string for each letter that exists.
letters = statement.downcase.split('')
letter_frequency = {}
letters.each do |letter|
  if letter_frequency.has_key?(letter)
    letter_frequency[letter] = letter_frequency[letter] + 1
  else 
    letter_frequency[letter] = 1 
  end
end

# 8
# Q: What happens when we modify an array while we are iterating over it? 
# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# A: Not sure without testing, but you should never modify something you're iterating over.