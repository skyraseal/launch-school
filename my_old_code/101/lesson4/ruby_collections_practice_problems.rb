## Problem 1
# Turn this array into a hash where the names are the keys and the values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_positions = Hash.new

flintstones.each do |chr|
  flintstones_positions[chr] = flintstones.index(chr) + 1
end

flintstones_positions

# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

## Problem 2
# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total = 0
ages.each_value {|age| total += age}
total

# ages.values.inject(:+) smoother

## Problem 3
# In the age hash: throw out the really old people (age 100 or older).
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
young_ages = ages.select {|k, v| v < 100}

## Problem 4
# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
min_age = ages.values.min

##Problem 5
# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
be = flintstones.index {|name| name[0, 2] == "Be"}

## Problem 6
# Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
fli_truncate = flintstones.map {|name| name[0, 3]}

## Problem 7
# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
letter_freq = {}
statement.split(//).sort.join("").each_char do |letter|
  if letter_freq.has_key?(letter)
    letter_freq[letter] += 1
  else
    letter_freq[letter] = 1
  end
end

## Problem 9
# Build a method that capitalizes each word as in a title
words = "the flintstones rock"
def titleize(words)
  words.split.map{|word| word.capitalize}.join(' ')
end

## Problem 10
# Given the munsters hash below
# Modify the hash such that each member of the Munster family has an additional "age_group" key 
# that has one of three values describing the age group the family member is in (kid, adult, or senior).
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  case
  when value["age"] < 18 then value["age_group"] = "kid"
  when value["age"] < 65 then value["age_group"] = "adult"
  else value["age_group"] = "senior"
  end
end
