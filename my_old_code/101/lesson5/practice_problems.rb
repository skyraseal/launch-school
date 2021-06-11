# Problem 1
# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']
new_arr = arr.sort do |a, b| #a to b
  a.to_i <=> b.to_i #a to b
end
new_arr

# Problem 2
# How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
new_books = books.sort_by {|book| book[:published]} #all integers, sortable using <=>
new_books

# Problem 3
# For each of these collection objects demonstrate how you would reference the letter 'g'.
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0]
hsh1['b'][1]
hsh2[:third].key(0)

# Problem 4
# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
hsh1 = {first: [1, 2, [3]]}
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4

# Problem 5
# Given the nested hash figure out the total age of just the male members of the family
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
total_age = 0
munsters.each_value do |munster|
  if munster["gender"] == "male"
    total_age += munster["age"]
  end
end
total_age

# Problem 6
# Given this previously seen family hash, print out the name, age and gender of each family member like this:
# (Name) is a (age)-year-old (male or female).
munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year-old #{details["gender"]}."
end

# Problem 8
# Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |array|
  puts array.join.delete("^aeiou").chars
end

# Problem 9
# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
desc_arr = arr.map do |subarray|
  subarray.sort {|a, b| b <=> a}
end

# Problem 10
# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr.map do |hashes|
  hashes.to_a.map do |kvpair|
    kvpair[1] += 1
    kvpair
  end.to_h
end

# Problem 11
# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr.map do |num_arr|
  num_arr.select {|num| num % 3 == 0}
end

# Problem 12
# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = Hash.new
arr.each do |kvpair|
  hsh[kvpair[0]] = kvpair[1]
end
hsh

# Problem 13
# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically according to the numeric value of the odd integers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.sort_by do |sub_array|
  sub_array.select {|num| num.odd?}
end

# Problem 14
# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
arr = []
hsh.each do |k, v|
  if v[:type] == 'fruit'
    arr << v[:colors].map{|color| color.capitalize}
  elsif v[:type] == 'vegetable'
    arr << v[:size].upcase
  end
end
arr

# Problem 15
# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
even_arr = arr.select do |sub_hash|
  all_even = true

  sub_hash.each_value do |num_array|
    num_array.each do |num|
      all_even = false if num.odd?
    end
  end

  if all_even == true
    true
  else
    false
  end
end
even_arr
# book solution
# arr.select do |hsh|
#   hsh.all? do |_, value|
#     value.all? do |num|
#       num.even?
#     end
#   end
# end

# Problem 16
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
# Write a method that returns one UUID when called with no parameters.
HEXADECIMAL = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
def generate_uuid
  rand_max = HEXADECIMAL.size
  first = ""
  8.times {first << "#{HEXADECIMAL[rand(rand_max)]}"}
  second = ""
  4.times {second << "#{HEXADECIMAL[rand(rand_max)]}"}
  third = ""
  4.times {third << "#{HEXADECIMAL[rand(rand_max)]}"}
  fourth =  ""
  4.times {fourth << "#{HEXADECIMAL[rand(rand_max)]}"}
  fifth =  ""
  12.times {fifth << "#{HEXADECIMAL[rand(rand_max)]}"}
  uuid = "#{first}-#{second}-#{third}-#{fourth}-#{fifth}"
end
